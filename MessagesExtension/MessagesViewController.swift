//
//  MessagesViewController.swift
//  MessagesExtension
//
//  Created by Max Rogers on 8/22/16.
//  Copyright © 2016 Max Rogers. All rights reserved.
//

import UIKit
import Messages
import AVFoundation

class MessagesViewController: MSMessagesAppViewController {
    var currentConvos = DataManager.sharedInstance.currentConvos
    let dataManager = DataManager.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MessagesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let message = currentConvos?[indexPath.row] ?? ""
        self.activeConversation?.insertText(message) { (error) in
            print(error?.localizedDescription)
        }
    }
}

extension MessagesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentConvos?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let backupCell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? BigTalkCell {
            cell.label.text = dataManager.currentConvos?[indexPath.row] ?? ""
            //cell.textLabel?.adjustsFontSizeToFitWidth = true
            //cell.textLabel?.minimumScaleFactor = 0.2
            return cell
        }
        return backupCell
    }

}
