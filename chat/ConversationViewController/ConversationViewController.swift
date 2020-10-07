//
//  ConversationViewController.swift
//  chat
//
//  Created by Maks on 30.09.2020.
//  Copyright © 2020 Maxim. All rights reserved.
//

import UIKit

class ConversationViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.popViewController(animated: true)
    }
    
    private let incomingCellIdentifier = String(describing: IncomingMessageTableViewCell.self)
    private let outcomingCellIdentifier = String(describing: OutcomingMessageTableViewCell.self)
    
    func setupTableView() {
        tableView.register(UINib(nibName: String(describing: IncomingMessageTableViewCell.self), bundle: nil), forCellReuseIdentifier: incomingCellIdentifier)
        tableView.register(UINib(nibName: String(describing: OutcomingMessageTableViewCell.self), bundle: nil), forCellReuseIdentifier: outcomingCellIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.sectionHeaderHeight = 0.0;
        tableView.sectionFooterHeight = 0.0;
        tableView.backgroundColor = Theme.current.backgroundColor
    }
    
}

extension ConversationViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return messagesList.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = messagesList[indexPath.section]
        if message.isMessageIncoming {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: incomingCellIdentifier, for: indexPath) as? IncomingMessageTableViewCell else { return UITableViewCell() }
            let incomingMessage = IncomingMessageTableViewCell.ConfigurationModel(text: message.text)
            
            cell.configure(with: incomingMessage)
            return cell
        }
        else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: outcomingCellIdentifier, for: indexPath) as? OutcomingMessageTableViewCell else { return UITableViewCell() }
            
            let outcomingMessage = OutcomingMessageTableViewCell.ConfigurationModel(text: message.text)
            
            cell.configure(with: outcomingMessage)
            return cell
        }
    }
    
}
