//
//  ViewController.swift
//  chat
//
//  Created by Maks on 14.09.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import UIKit
import Photos

class ProfileViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextViewDelegate {
    
    // MARK: - Properties
    
    var imagePicker = UIImagePickerController()
    var isProfileEditing = false
    var isProfileNameChanged = false
    var isProfileDescriptionChanged = false
    var bottom: CGFloat = 0.0
    
    @IBOutlet weak var initialsLabel: UILabel!
    @IBOutlet weak var editInfoButton: UIButton!
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var gcdSaveButton: UIButton!
    @IBOutlet weak var operationSaveButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    // MARK: - UIViewController lifecycle methods
    
    required init?(coder:NSCoder) {
        super.init(coder:coder)
        //        print(editButton.frame) Cвойство frame равно nil. Вью и его объекты еще не загружены, соответсвенно, свойство frame еще не определено. На этом этапе еще нет ни самой view, ни аутлетов.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        print(editButton.frame) // Свойство frame успешно распечатано, но параметры frame относятся к значениям из сториборда. На данном этапе жизненного цикла контроллера, размеры view не актуальны, т.е. не такие, какими они будут после вывода на экран.
        LogManager.printLog(log: "After loadView method, viewDidLoad method was executed: \(#function)")
        activityIndicator.hidesWhenStopped = true
        descriptionTextView.delegate = self
        //        GCDDataManager.loadTextDataFromFiles(profileVC: self)
        //        GCDDataManager.loadPictureFromFile(profileVC: self)
        loadTextData()
        loadPictureData()
        addNotificationKeyboardObserver()
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
        bottom = self.view.frame.origin.y
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        LogManager.printLog(log: "After viewDidAppear method, viewWillDisappear method was executed: \(#function)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        LogManager.printLog(log: "After viewWillDisappear method, viewDidDisappear method was executed: \(#function)")
    }
    
    // MARK: - Methods
    
    private func configureItems() {
        view.backgroundColor = Theme.current.backgroundColor
        profilePictureImageView.layer.cornerRadius = profilePictureImageView.bounds.width / 2
        configureButton(button: editInfoButton)
        configureButton(button: gcdSaveButton)
        configureButton(button: operationSaveButton)
    }
    
    private func configureButton(button: UIButton) {
        button.backgroundColor = Theme.current.textBackgroundColor
        button.layer.cornerRadius = button.bounds.height / 2
    }
    
    // MARK: User interaction
    
    @IBAction func editInfoButtonTapped(_ sender: UIButton) {
        changeItemsConfigure()
        if !isProfileEditing {
            //            GCDDataManager.loadTextDataFromFiles(profileVC: self)
            loadTextData()
        }
    }
    
    @IBAction func gcdSaveButtonTapped(_ sender: UIButton) {
        changeItemsConfigure()
        saveDataToFileWithGCD()
    }
    
    @IBAction func operationSaveButtonTapped(_ sender: UIButton) {
        changeItemsConfigure()
        saveDataToFileWithOperation()
    }
    
    func changeItemsConfigure() {
        gcdSaveButton.isEnabled = false
        operationSaveButton.isEnabled = false
        isProfileEditing = !isProfileEditing
        isProfileEditing ? editInfoButton.setTitle("Отмена", for: .normal) : editInfoButton.setTitle("Редактировать", for: .normal)
        gcdSaveButton.isHidden = !gcdSaveButton.isHidden
        operationSaveButton.isHidden = !operationSaveButton.isHidden
        nameTextField.isEnabled = !nameTextField.isEnabled
        descriptionTextView.isEditable = !descriptionTextView.isEditable
    }
    
    @IBAction func nameTextFieldChanged(_ sender: UITextField) {
        isProfileNameChanged = true
        gcdSaveButton.isEnabled = true
        operationSaveButton.isEnabled = true
    }
    
    func textViewDidChange(_ textView: UITextView) { // textViewDidEndEditing
        isProfileDescriptionChanged = true
        gcdSaveButton.isEnabled = true
        operationSaveButton.isEnabled = true
    }
    
    // MARK: Work with datamanagers
    
    func saveDataToFileWithGCD() {
        guard let name = nameTextField.text, let description = descriptionTextView.text, nameTextField.text != "", descriptionTextView.text != ""
        else { showErrorAlertController(withText: "Имя и описание профиля должны быть заполнены")
            return }
        
        GCDDataManager.saveTextDataToFiles(profileVC: self, name: name, description: description, isProfileNameChanged: isProfileNameChanged, isProfileDescriptionChanged: isProfileDescriptionChanged)
    }
    
    func saveDataToFileWithOperation() {
        guard let name = nameTextField.text, let description = descriptionTextView.text, nameTextField.text != "", descriptionTextView.text != ""
        else { showErrorAlertController(withText: "Имя и описание профиля должны быть заполнены")
            return }
        
        OperationDataManager.saveTextDataToFiles(profileVC: self, name: name, description: description, isProfileNameChanged: isProfileNameChanged, isProfileDescriptionChanged: isProfileDescriptionChanged)
    }
    
    func loadTextData() {
        let data = GCDDataManager.loadTextDataFromFiles()
//        let data = OperationDataManager.loadTextDataFromFiles()
        self.nameTextField.text = data.name
        self.descriptionTextView.text = data.description ?? "Description of your profile"
    }
    
    func loadPictureData() {
        if let picture = GCDDataManager.loadPictureFromFile() {
//        if let picture = OperationDataManager.loadPictureFromFile() {
            self.profilePictureImageView.image = picture
            self.initialsLabel.isHidden = true
        }
    }
    
    // MARK: Work with avatar
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
            showErrorAlertController(withText: "К сожалению, камера недоступна")
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
            showErrorAlertController(withText: "К сожалению, галерея недоступна")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        if let image = info[.originalImage] as? UIImage {
            profilePictureImageView.image = image
            initialsLabel.isHidden = true
            //            GCDDataManager.savePictureToFile(picture: image)
            OperationDataManager.savePictureToFile(picture: image)
        }
    }
    
    // MARK: Alert
    
    func showErrorAlertController(withText message: String){
        let errorAlertController = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        errorAlertController.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(errorAlertController, animated: true, completion: nil)
    }
    
    func showGCDDataSaveErrorAlertController(){
        let errorAlertController = UIAlertController(title: "Ошибка", message: "Не удалось сохранить данные", preferredStyle: .alert)
        
        let repitAction = UIAlertAction(title: "Повторить", style: .default) { action in
            self.saveDataToFileWithGCD()
        }
        errorAlertController.addAction(UIAlertAction(title: "OK", style: .default))
        errorAlertController.addAction(repitAction)
        present(errorAlertController, animated: true, completion: nil)
    }
    
    func showOperationDataSaveErrorAlertController(){
        let errorAlertController = UIAlertController(title: "Ошибка", message: "Не удалось сохранить данные", preferredStyle: .alert)
        
        let repitAction = UIAlertAction(title: "Повторить", style: .default) { action in
            self.saveDataToFileWithOperation()
        }
        errorAlertController.addAction(UIAlertAction(title: "OK", style: .default))
        errorAlertController.addAction(repitAction)
        present(errorAlertController, animated: true, completion: nil)
    }
    
    func showDataSaveAlertController(){
        let alertController = UIAlertController(title: "Данные сохранены", message: nil, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true, completion: nil)
    }
    
    // MARK: Work with keyboard
    
    func addNotificationKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
              let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        let keyboardFrame = keyboardSize.cgRectValue
        if self.view.frame.origin.y == bottom {
            self.view.frame.origin.y -= keyboardFrame.height
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
              let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        let keyboardFrame = keyboardSize.cgRectValue
        //        self.view.frame.origin.y += keyboardFrame.height
        if self.view.frame.origin.y == bottom - keyboardFrame.height {
            self.view.frame.origin.y += keyboardFrame.height
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    
}
