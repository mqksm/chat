//
//  ThemesViewController.swift
//  chat
//
//  Created by Maks on 06.10.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import UIKit

class ThemesViewController: UIViewController {
    
    @IBOutlet weak var classicView: UIView!
    @IBOutlet weak var nightView: UIView!
    @IBOutlet weak var dayView: UIView!
    
    @IBOutlet weak var classicImageView: UIImageView!
    @IBOutlet weak var nightImageView: UIImageView!
    @IBOutlet weak var dayImageView: UIImageView!
    
    //    делегат:
//        weak var delegate: ThemePickerDelegate? // В случае, если ссылка будет сильная, может возникнуть retain cycle
    
    //    замыкание:
        var themeApplied: (() -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func classicThemeButtonTapped(_ sender: UIButton) {
        Theme.classic.apply()
        setupView()
        //    делегат:
//            delegate?.ThemeApplied()
        //    замыкание:
            themeApplied?()
    }
    
    @IBAction func dayThemeButtonTapped(_ sender: UIButton) {
        Theme.day.apply()
        setupView()
        //    делегат:
//            delegate?.ThemeApplied()
        //    замыкание:
            themeApplied?()
    }
    
    @IBAction func nightThemeButtonTapped(_ sender: UIButton) {
        Theme.night.apply()
        setupView()
        //    делегат:
//            delegate?.ThemeApplied()
        //    замыкание:
            themeApplied?()
    }
    
    func setupView() {
        view.backgroundColor = Theme.current.themesVCBackgroundColor
        nightImageView.layer.cornerRadius = classicView.bounds.height / 6
        nightImageView.clipsToBounds = true
        dayImageView.layer.cornerRadius = classicView.bounds.height / 6
        dayImageView.clipsToBounds = true
        classicImageView.layer.cornerRadius = classicView.bounds.height / 6
        classicImageView.clipsToBounds = true
        
        switch Theme.current {
        case .classic:
            classicImageView.layer.borderColor = UIColor.blue.cgColor
            classicImageView.layer.borderWidth = 2
            dayImageView.layer.borderWidth = 0
            nightImageView.layer.borderWidth = 0
        case .day:
            dayImageView.layer.borderColor = UIColor.blue.cgColor
            dayImageView.layer.borderWidth = 2
            classicImageView.layer.borderWidth = 0
            nightImageView.layer.borderWidth = 0
        case .night:
            nightImageView.layer.borderColor = UIColor.blue.cgColor
            nightImageView.layer.borderWidth = 2
            dayImageView.layer.borderWidth = 0
            classicImageView.layer.borderWidth = 0
        }
    }
    
}
    //     делегат:
//
//protocol ThemePickerDelegate: class {
//    func ThemeApplied()
//}
