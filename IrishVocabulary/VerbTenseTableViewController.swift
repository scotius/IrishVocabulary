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
    
    

    @IBOutlet weak var segment: UISegmentedControl!
    var sectionsArray = [VerbTenseSection]()
    var positiveSectionsArray = [VerbTenseSection]()
    var negativeSectionsArray = [VerbTenseSection]()
    var interrogativeSectionsArray = [VerbTenseSection]()
    var impersonalSectionsArray = [VerbTenseSection]()
    var verb = Verb()
    var parts = VerbParts()
    var tense = ""
    var singularPositiveItems = [String]()
    var singularNegativeItems = [String]()
    var singularInterrogativeItems = [String]()
    var pluralPositiveItems = [String]()
    var pluralNegativeItems = [String]()
    var pluralInterrogativeItems = [String]()
    var impersonalPositiveItems = [String]()
    var impersonalNegativeItems = [String]()
    var impersonalInterrogativeItems = [String]()
    
    
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
                return sectionsArray[section].items.count
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
                return sectionsArray.count
    }
    
    func createVerbTenseSections() {
        
        let singularPositiveSection = VerbTenseSection()
        singularPositiveSection.heading = "Singular"
        singularPositiveSection.items = singularPositiveItems
        let singularNegativeSection = VerbTenseSection()
        singularNegativeSection.heading = "Singular"
        singularNegativeSection.items = singularNegativeItems
        let singularInterrogativeSection = VerbTenseSection()
        singularInterrogativeSection.heading = "Singular"
        singularInterrogativeSection.items = singularInterrogativeItems
        let pluralPositiveSection = VerbTenseSection()
        pluralPositiveSection.heading = "Plural"
        pluralPositiveSection.items = pluralPositiveItems
        let pluralNegativeSection = VerbTenseSection()
        pluralNegativeSection.heading = "Plural"
        pluralNegativeSection.items = pluralNegativeItems
        let pluralInterrogativeSection = VerbTenseSection()
        pluralInterrogativeSection.heading = "Plural"
        pluralInterrogativeSection.items = pluralInterrogativeItems
        let impersonalPositiveSection = VerbTenseSection()
        impersonalPositiveSection.heading = "Impersonal"
        impersonalPositiveSection.items = impersonalPositiveItems
        let impersonalNegativeSection = VerbTenseSection()
        impersonalNegativeSection.heading = "Impersonal"
        impersonalNegativeSection.items = impersonalNegativeItems
        let impersonalInterrogativeSection = VerbTenseSection()
        impersonalInterrogativeSection.heading = "Impersonal"
        impersonalInterrogativeSection.items = impersonalInterrogativeItems
        positiveSectionsArray.append(singularPositiveSection)
        positiveSectionsArray.append(pluralPositiveSection)
        positiveSectionsArray.append(impersonalPositiveSection)
        negativeSectionsArray.append(singularNegativeSection)
        negativeSectionsArray.append(pluralNegativeSection)
        negativeSectionsArray.append(impersonalNegativeSection)
        impersonalSectionsArray.append(impersonalPositiveSection)
        impersonalSectionsArray.append(impersonalNegativeSection)
        impersonalSectionsArray.append(impersonalInterrogativeSection)


}

  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionsArray[section].heading
    }
    
    
    
    
    @IBAction func segmentPressed(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            sectionsArray = positiveSectionsArray
            tableView.reloadData()
        case 1:
            sectionsArray = negativeSectionsArray
            tableView.reloadData()
        case 2:
            sectionsArray = interrogativeSectionsArray
            tableView.reloadData()
        default:
            sectionsArray = positiveSectionsArray        }

        
    }
    
    
        
    
   }
