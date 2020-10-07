//
//  ThemesViewController.swift
//  chat
//
//  Created by Maks on 06.10.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import UIKit

class ThemesViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Theme.current.themesVCBackgroundColor
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func classicThemeButtonTapped(_ sender: UIButton) {
        Theme.classic.apply()
        view.backgroundColor = Theme.classic.themesVCBackgroundColor
    }
    
    @IBAction func dayThemeButtonTapped(_ sender: UIButton) {
        Theme.day.apply()
        view.backgroundColor = Theme.day.themesVCBackgroundColor
    }
    
    @IBAction func nightThemeButtonTapped(_ sender: UIButton) {
        Theme.night.apply()
        view.backgroundColor = Theme.night.themesVCBackgroundColor
    }
    
    
    
    
    
}
