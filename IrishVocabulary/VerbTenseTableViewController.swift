//
//  VerbTenseViewController.swift
//  IrishRealm
//
//  Created by Scott on 12/4/16.
//  Copyright © 2016 Scott. All rights reserved.
//

import Foundation
import UIKit


class VerbTenseTableViewController : UITableViewController {
    
    
    
    var verb = Verb()
    var verbParts = VerbParts()
    var tense = ""
    var verbTense = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "verbTenseCell", for: indexPath)
        
        cell.textLabel?.text = verbTense[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return verbTense.count
    }
    
    
    
    
    
    //    imperative
    //    presentSubjunctive
    
    
    
    
    
    
    
    
}
