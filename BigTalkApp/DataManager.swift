//
//  DataManager.swift
//  BigTalk
//
//  Created by Max Rogers on 9/7/16.
//  Copyright © 2016 Max Rogers. All rights reserved.
//

import UIKit
import CoreData

class DataManager {
    static let sharedInstance = DataManager()
    static let suiteName = "group.com.yourdomain.YourAwesomeGroup"
    var currentConvos: [String]?
//    lazy var applicationDocumentsDirectory: NSURL? = {
//        return NSFileManager.defaultManager().containerURLForSecurityApplicationGroupIdentifier("group.com.yourdomain.YourAwesomeGroup") ?? nil
//    }()
//    
    let sharedDefaults = {
        return UserDefaults(suiteName: suiteName)
    }
    private init() {
        //check if userdefaults is empty
        seedConvoStarters()
    }
    
    func allConvoStarters() -> [String: [String]] {
        return [String: [String]]()
    }
    
    func seedConvoStarters() {
        sharedDefaults()?.set(["a","b","c"], forKey: "abc")
        currentConvos = sharedDefaults()?.array(forKey: "abc") as? [String] ?? []
    }

}
