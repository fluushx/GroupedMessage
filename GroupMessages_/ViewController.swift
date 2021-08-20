//
//  ViewController.swift
//  GroupMessages_
//
//  Created by Felipe Ignacio Zapata Riffo on 20-08-21.
//

import UIKit

struct ChatMessage {
    var text: String
    let isIcoming : Bool
}
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let chatMessage = [ChatMessage(text: "here's my first messages", isIcoming: true),
                       ChatMessage(text: "im going to massege another long message that will word wrap", isIcoming: false),
                       ChatMessage(text: "im going to massege another long message that will word wrap,im going to massege another long message that will word wrap,im going to massege another long message that will word wrap", isIcoming: true),
                       ChatMessage(text: "im going to massege another short message", isIcoming: false)
    ]
    
    let tableView : UITableView = {
        let tableView = UITableView()
        tableView.register(ChatMessageTableViewCell.self, forCellReuseIdentifier: ChatMessageTableViewCell.ident)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView 
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Messages"
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.layer.cornerRadius = 5
        
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        setUpView()
        
 
    }
    
    private func setUpView (){
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatMessage.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ChatMessageTableViewCell
        let chatMessage = chatMessage[indexPath.row]
        cell.chatMessage = chatMessage
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

