//
//  ConversationsListViewController.swift
//  chat
//
//  Created by Maks on 27.09.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import UIKit
//import Firebase
import CoreData

class ConversationsListViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileImageButton: UIButton!
    private let cellIdentifier = String(describing: ConversationsListTableViewCell.self)
    private lazy var fetchedResultsController: NSFetchedResultsController<ChannelCD> = {
        let fetchRequest: NSFetchRequest<ChannelCD> = ChannelCD.fetchRequest()
        let sortDateDescriptor = NSSortDescriptor(key: "lastActivity", ascending: false)
        let sortNameDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDateDescriptor, sortNameDescriptor]
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest,
                                                                  managedObjectContext: CoreDataStack.shared.mainContext,
                                                                  sectionNameKeyPath: nil,
                                                                  cacheName: nil)
        try? fetchedResultsController.performFetch()
        fetchedResultsController.delegate = self
        return fetchedResultsController
    }()
    
    // MARK: - UIViewController lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileImageButton.layer.cornerRadius = profileImageButton.bounds.height / 2
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        FirebaseManager.shared.getChannels()
    }
    
    // MARK: - Methods
    
    @IBAction func settingsButtonTapped(_ sender: UIBarButtonItem) {
        let themesVC = ThemesViewController()
        themesVC.title = "Settings"
        
        // MARK: Delegate
        //                themesVC.delegate = self
        
        // MARK: Closure
        themesVC.themeApplied = { [weak self] in
            self?.tableView.backgroundColor = Theme.current.backgroundColor
            self?.view.backgroundColor = Theme.current.backgroundColor
            self?.navigationController?.navigationBar.barStyle = Theme.current.barStyle
            self?.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Theme.current.textColor]
            self?.navigationController?.navigationBar.isTranslucent = false
            self?.tableView.reloadData()
        }
        navigationController?.pushViewController(themesVC, animated: true)
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: String(describing: ConversationsListTableViewCell.self), bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        view.backgroundColor = Theme.current.backgroundColor
    }
    
    @IBAction func addChannelTapped(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Создание нового канала", message: "Введите имя нового канала", preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.textColor = .black
        }
        let save = UIAlertAction(title: "Создать", style: .default) { [weak self] _ in
            guard let textField = alertController.textFields?.first, textField.text != "" else {
                self?.presentAlertWithTitle(title: "Ошибка", message: "Название канала не должно быть пустым!", options: "ОК") { (_) in
            }
                return }
            if let channelName = textField.text {
                FirebaseManager.shared.addChannel(name: channelName)
            }
        }
        let cancel = UIAlertAction(title: "Отмена", style: .default, handler: nil)
        alertController.addAction(save)
        alertController.addAction(cancel)
        present(alertController, animated: true, completion: nil)
    }

}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension ConversationsListViewController: UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let sections = fetchedResultsController.sections else { return 0 }
        return sections[section].numberOfObjects
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ConversationsListTableViewCell else { return UITableViewCell() }
        let channel = fetchedResultsController.object(at: indexPath)
        cell.configure(with: channel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let channel = fetchedResultsController.object(at: indexPath)
        let conversationVC = ConversationViewController(channel: channel)
        navigationController?.pushViewController(conversationVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            let channel = self.fetchedResultsController.object(at: indexPath)
            FirebaseManager.shared.deleteChannel(channel: channel)
//            self.reference.document(channel.identifier ?? "").delete()
            CoreDataManager.shared.deleteChannel(channel: channel)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>,
                    didChange anObject: Any,
                    at indexPath: IndexPath?,
                    for type: NSFetchedResultsChangeType,
                    newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let newIndexPath = newIndexPath {
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        case .move:
            if let newIndexPath = newIndexPath, let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .automatic)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        case .update:
            if let indexPath = indexPath {
                tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        @unknown default:
            fatalError()
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
}

// MARK: - Delegate
//extension ConversationsListViewController: ThemePickerDelegate {
//    func ThemeApplied() {
//        self.tableView.backgroundColor = Theme.current.backgroundColor
//        self.view.backgroundColor = Theme.current.backgroundColor
//        self.navigationController?.navigationBar.barStyle = Theme.current.barStyle
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Theme.current.textColor]
//        self.navigationController?.navigationBar.isTranslucent = false
//        self.tableView.reloadData()
//    }
//
//}
