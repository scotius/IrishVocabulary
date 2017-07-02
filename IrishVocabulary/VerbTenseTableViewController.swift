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
    
    
    var sectionsArray = [[VerbTenseSection]]()
    var verb = Verb()
    var verbParts = VerbParts()
    var tense = ""
    var singular = [String]()
    var plural = [String]()
    var impersonal = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "verbTenseCell", for: indexPath)
        
         cell.textLabel?.text = sectionsArray[indexPath.section]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sectionsArray[section].count
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionsArray.count
    }
    
    func createVerbTenseSections() {
        
        let singularSection = VerbTenseSection(heading: "Singular", items: singular)
        let pluralSection = VerbTenseSection(heading: "Singular", items: plural)
        let impersonalSection = VerbTenseSection(heading: "Impersonal", items: impersonal)
        sectionsArray.append([singularSection])
        sectionsArray.append([pluralSection])
        sectionsArray.append([impersonalSection])
        
}
/*

    
   
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].heading
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sectionCell", for: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = sections[indexPath.section].items[indexPath.row]
        
        return cell
    }
*/
}
