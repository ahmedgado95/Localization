//
//  Localizer.swift
//  3aqarat
//
//  Created by ahmed gado on 7/23/19.
//  Copyright © 2019 ahmed gado. All rights reserved.
//

import Foundation

class Localizer {
    class func DoTheExhange() {
        ExchangeMethodsForClass(className: Bundle.self, originalSelector: #selector(Bundle.localizedString(forKey:value:table:)), overrideSelector: #selector(Bundle.customLocalizedString(forKey:value:table:)))
    }
}

extension Bundle {
    @objc func customLocalizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        let currentLanguage = Language.currentLanguage().contains("en") ? "en" : "ar"
        print(currentLanguage)
        var bundle = Bundle()
        if let path = Bundle.main.path(forResource: currentLanguage, ofType: "lproj") {
            bundle = Bundle(path: path)!
        } else {
            let path = Bundle.main.path(forResource: "Base", ofType: "lproj")
            bundle = Bundle(path: path!)!
        }
        
        return bundle.customLocalizedString(forKey: key, value:value, table:tableName)
    }
}


func ExchangeMethodsForClass(className: AnyClass, originalSelector: Selector, overrideSelector: Selector) {
    let originalMethod: Method = class_getInstanceMethod(className, originalSelector)!
    let overrideMethod: Method = class_getInstanceMethod(className, overrideSelector)!
    
    if class_addMethod(className, originalSelector, method_getImplementation(overrideMethod), method_getTypeEncoding(overrideMethod)) {
        class_replaceMethod(className, overrideSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
    } else {
        method_exchangeImplementations(originalMethod, overrideMethod)
    }
}
