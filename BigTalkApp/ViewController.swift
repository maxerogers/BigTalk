//
//  ViewController.swift
//  BigTalkApp
//
//  Created by Max Rogers on 9/5/16.
//  Copyright © 2016 Max Rogers. All rights reserved.
//

import UIKit
import Toast

class ViewController: UITableViewController {
    
    let dataManager = DataManager.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//UITableViewDelegate
extension ViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pasteBoard = UIPasteboard.general
        pasteBoard.string = dataManager.currentConvos?[indexPath.row]
        self.view.makeToast("Copied to clipboard")
    }
}

//UITableViewDataSource
extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.currentConvos?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let backupCell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? backupCell
        cell.textLabel?.text = dataManager.currentConvos?[indexPath.row] ?? ""
        return cell
    }
}
