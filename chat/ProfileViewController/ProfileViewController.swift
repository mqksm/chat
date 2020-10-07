//
//  ViewController.swift
//  chat
//
//  Created by Maks on 14.09.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import UIKit
import Photos

class ProfileViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var imagePicker = UIImagePickerController()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileDescriptionLabel: UILabel!
    @IBOutlet weak var initialsLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var editButton: UIButton!
    
    required init?(coder:NSCoder) {
        super.init(coder:coder)
        //        print(editButton.frame) Cвойство frame равно nil. Вью и его объекты еще не загружены, соответсвенно, свойство frame еще не определено. На этом этапе еще нет ни самой view, ни аутлетов.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        print(editButton.frame) // Свойство frame успешно распечатано, но параметры frame относятся к значениям из сториборда. На данном этапе жизненного цикла контроллера, размеры view не актуальны, т.е. не такие, какими они будут после вывода на экран.
        LogManager.printLog(log: "After loadView method, viewDidLoad method was executed: \(#function)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        LogManager.printLog(log: "After viewDidLoad method or after viewDidDisappear method, viewWillAppear method was executed: \(#function)")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        LogManager.printLog(log: "After viewWillAppear method or after rotating the device, viewWillLayoutSubviews method was executed: \(#function)")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        LogManager.printLog(log: "After viewWillLayoutSubviews method, viewDidLayoutSubviews method was executed: \(#function)")
        configureItems()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //        print(editButton.frame) // На данном этапе распечатаны корректные значения свойства frame кнопки Edit, которые относятся к используемому устройству. В методе viewDidLoad значения свойств frame относятся к значениям устройства в сториборде. При вызове viewDidAppear, view уже находится в иерархии отображения и имеет актуальные размеры.
        LogManager.printLog(log: "After viewDidLayoutSubviews method, viewDidAppear method was executed: \(#function)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        LogManager.printLog(log: "After viewDidAppear method, viewWillDisappear method was executed: \(#function)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        LogManager.printLog(log: "After viewWillDisappear method, viewDidDisappear method was executed: \(#function)")
    }
    
    private func configureItems() {
        view.backgroundColor = Theme.current.backgroundColor
        saveButton.backgroundColor = Theme.current.textBackgroundColor
        profilePictureImageView.layer.cornerRadius = profilePictureImageView.bounds.width / 2
        saveButton.layer.cornerRadius = saveButton.bounds.height / 2
    }
    
    @IBAction func editPictureTapped(_ sender: UIButton) {
        let pictureChangingAlertController = UIAlertController(title: "Изменить изображение", message: nil, preferredStyle: .actionSheet)
        pictureChangingAlertController.addAction(UIAlertAction(title: "Установить из галереи", style: .default, handler: { _ in
            self.choosePicture()
        }))
        
        pictureChangingAlertController.addAction(UIAlertAction(title: "Сделать фото", style: .default, handler: { _ in
            self.takePicture()
        }))
        pictureChangingAlertController.addAction(UIAlertAction.init(title: "Отменить", style: .cancel, handler: nil))
        present(pictureChangingAlertController, animated: true, completion: nil)
    }
    
    func takePicture() {
        let isCameraAvailable = UIImagePickerController.isSourceTypeAvailable(.camera)
        if isCameraAvailable {
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = true
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            showErrorAlertController(with: "К сожалению, камера недоступна")
        }
    }
    
    func choosePicture() {
        let isPhotoLibraryAvailable = UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
        if isPhotoLibraryAvailable {
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            showErrorAlertController(with: "К сожалению, галерея недоступна")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        if let image = info[.originalImage] as? UIImage {
            profilePictureImageView.image = image
            initialsLabel.isHidden = true
        }
    }
    
    func showErrorAlertController(with message: String){
        let errorAlertController = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        errorAlertController.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(errorAlertController, animated: true, completion: nil)
    }
    
}

