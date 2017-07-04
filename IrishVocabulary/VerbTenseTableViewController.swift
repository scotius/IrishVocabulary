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
    
    
    var sectionsArray = [VerbTenseSection]()
    var verb = Verb()
    var verbParts = VerbParts()
    var tense = ""
    var singularItems = [String]()
    var pluralItems = [String]()
    var impersonalItems = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createVerbTenseSections()
       
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "verbTenseCell", for: indexPath)
        
         cell.textLabel?.text = sectionsArray[indexPath.section].items[indexPath.row]
            return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sectionsArray[section].items.count
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionsArray.count
    }
    
    func createVerbTenseSections() {
        
        let singularSection = VerbTenseSection()
        singularSection.heading = "Singular"
        singularSection.items = singularItems
        let pluralSection = VerbTenseSection()
        pluralSection.heading = "Plural"
        pluralSection.items = pluralItems
        let impersonalSection = VerbTenseSection()
        impersonalSection.heading = "Impersonal"
        impersonalSection.items = impersonalItems
        sectionsArray.append(singularSection)
        sectionsArray.append(pluralSection)
        sectionsArray.append(impersonalSection)
        
}

  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionsArray[section].heading
    }
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sectionCell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = sections[indexPath.section].items[indexPath.row]
        
        return cell
    }
*/
}
