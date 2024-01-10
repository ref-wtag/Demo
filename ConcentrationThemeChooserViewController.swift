//
//  ConcentrationThemeChooserViewController.swift
//  Demo
//
//  Created by Refat E Ferdous on 1/9/24.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController {

    let themes = [
        "Sports" : "🥎🏓⛹️🏑⚽️🛼",
        "Faces" : "☺️😊😇🥰😍🤩",
        "Animal" : "🐘🦤🐇🦜🐸🐼"
    ]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "Choose Theme" {
                if let button = sender as? UIButton {
                    if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                        if let cvc = segue.destination as? ConcentrationViewController {
                            cvc.theme = theme
                        }
                    }
                }
            }
    }
}
