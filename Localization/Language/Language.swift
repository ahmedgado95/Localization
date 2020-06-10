//
//  Language.swift
//  Localization

//
//  Created by ahmed gado on 7/23/19.
//  Copyright © 2019 ahmed gado. All rights reserved.
//
import Foundation
class Language {
    class func currentLanguage() -> String {
        let def = UserDefaults.standard
        let langs = def.object(forKey: "AppleLanguages") as! NSArray
        let firstLang = langs.firstObject as! String
        return firstLang
    }
    class func setAppLanguage(lang: String) {
        let def = UserDefaults.standard
        let langs = def.object(forKey: "AppleLanguages") as! NSArray
        var selectedLang = lang
        for l in langs {
            if (l as! String).contains(lang){
                selectedLang = l as! String
            }
        }
        def.set([selectedLang, currentLanguage()], forKey: "AppleLanguages")
        def.synchronize()
    }
}
 
extension String {
    // MARK: Localization
    public func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
