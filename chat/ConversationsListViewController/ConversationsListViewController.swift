//
//  ConversationsListViewController.swift
//  chat
//
//  Created by Maks on 27.09.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import UIKit

class ConversationsListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileImageButton: UIButton!
    
    
    
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
        tableView.reloadData()
    }
    
    @IBAction func settingsButtonTapped(_ sender: UIBarButtonItem) {
        let themesVC =  ThemesViewController()
        themesVC.title = "Settings"
        
        // делегат
//                themesVC.delegate = self
        
        // замыкание:
                themesVC.themeApplied = {
                    self.tableView.backgroundColor = Theme.current.backgroundColor
                    self.view.backgroundColor = Theme.current.backgroundColor
                    self.navigationController?.navigationBar.barStyle = Theme.current.barStyle
                    self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Theme.current.textColor]
                    self.navigationController?.navigationBar.isTranslucent = false
                }
        
        navigationController?.pushViewController(themesVC, animated: true)
    }
    
    private let cellIdentifier = String(describing: ConversationsListTableViewCell.self)
    
    func setupTableView() {
        tableView.register(UINib(nibName: String(describing: ConversationsListTableViewCell.self), bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        view.backgroundColor = Theme.current.backgroundColor
    }
    
}

extension ConversationsListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        if let header = view as? UITableViewHeaderFooterView {
            header.backgroundView?.backgroundColor = Theme.current.textBackgroundColor
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionNames.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionNames[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ConversationsListTableViewCell else { return UITableViewCell() }
        
        let chat = chats[indexPath.section][indexPath.row]
        cell.configure(with: chat)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let conversationVC =  ConversationViewController()
        conversationVC.title = chats[indexPath.section][indexPath.row].name
        navigationController?.pushViewController(conversationVC, animated: true)
    }
    
    
}

        // делегат
//extension ConversationsListViewController: ThemePickerDelegate {
//    func ThemeApplied() {
//        self.tableView.backgroundColor = Theme.current.backgroundColor
//        self.view.backgroundColor = Theme.current.backgroundColor
//        self.navigationController?.navigationBar.barStyle = Theme.current.barStyle
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Theme.current.textColor]
//        self.navigationController?.navigationBar.isTranslucent = false
//    }
//
//}
