//
//  ViewController.swift
//  Localization
//
//  Created by ahmed gado on 6/10/20.
//  Copyright © 2020 ahmed gado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextPageButtonPressed(_ sender: Any) {
        
        let vc = Storyboard.Main.instantiate(WelcomeVC.self)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func englishButtonPressed(_ sender: Any) {
        if Language.currentLanguage().contains("ar"){
            Language.setAppLanguage(lang: "en")
            Localizer.DoTheExhange()
            self.setAppSemantic()
            UIView.transition(with: self.view.window!, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            let vc = Storyboard.Main.initialViewController()
            UIApplication.shared.keyWindow?.setRootViewController(vc)
        }
        

     
    }
    
    @IBAction func arabicButtonPressed(_ sender: Any) {
        if Language.currentLanguage().contains("en"){
                 Language.setAppLanguage(lang: "ar")
                 Localizer.DoTheExhange()
                 self.setAppSemantic()
                 UIView.transition(with: self.view.window!, duration: 0.5, options: .transitionFlipFromLeft, animations: nil, completion: nil)
                 let vc = Storyboard.Main.initialViewController()
               
                 UIApplication.shared.keyWindow?.setRootViewController(vc)
             }
    }
    private func setAppSemantic() {
        // app direction
        if Language.currentLanguage().contains("en") {
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            UILabel.appearance().semanticContentAttribute = .forceLeftToRight
            UITextField.appearance().textAlignment = .left
            UITextView.appearance().textAlignment = .left
            UITableView.appearance().semanticContentAttribute = .forceLeftToRight
            UITabBar.appearance().semanticContentAttribute = .forceLeftToRight
        } else if Language.currentLanguage().contains("ar") {
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            UILabel.appearance().semanticContentAttribute = .forceRightToLeft
            UITextField.appearance().textAlignment = .right
            UITextView.appearance().textAlignment = .right
            UITableView.appearance().semanticContentAttribute = .forceRightToLeft
            UITabBar.appearance().semanticContentAttribute = .forceRightToLeft
            
        }
    }
    
}

