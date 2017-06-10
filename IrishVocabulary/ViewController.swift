//
//  ViewController.swift
//  IrishVocabulary
//
//  Created by Scott on 5/7/17.
//  Copyright © 2017 Scott. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    

    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadDatabase()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func loadDatabase() {
        //Checks to see if Realm database already exists.
        //If not, copies over pre-populated default.realm
        let defaultRealmPath = Realm.Configuration.defaultConfiguration.fileURL!
        let bundleReamPath = Bundle.main.path(forResource: "default", ofType:"realm")
        
        if !FileManager.default.fileExists(atPath: defaultRealmPath.path) {
            do
            {
                try FileManager.default.copyItem(atPath: bundleReamPath!, toPath: defaultRealmPath.path)
            }
            catch let error as NSError {
                // Catch fires here, with an NSError being thrown
                print("error occurred, here are the details:\n \(error)")
            }
    }
}

}
