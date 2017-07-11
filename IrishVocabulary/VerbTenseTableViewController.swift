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
    var verb = Verb()
    var parts = VerbParts()
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
                return sectionsArray[section].items.count
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
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
    @IBAction func segmentPressed(_ sender: Any) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            firstSingularLabel.text = verbParts.firstPersonSingPos
            secondSingularLabel.text = verbParts.secondPersonSingPos
            thirdSingularLabel.text = verbParts.thirdPersonSingPos
            firstPluralLabel.text = verbParts.firstPersonPlPos
            firstPluralAlternateLabel.text = verbParts.firstPersonPlPosAlt
            secondPluralLabel.text = verbParts.secondPersonPlPos
            thirdPluralLabel.text = verbParts.thirdPersonPlPos
            thirdPluralAlternateLabel.text = verbParts.thirdPersonPlPosAlt
            
        case 1:
            
            firstSingularLabel.text = verbParts.firstPersonSingNeg
            secondSingularLabel.text = verbParts.secondPersonSingNeg
            thirdSingularLabel.text = verbParts.thirdPersonSingNeg
            firstPluralLabel.text = verbParts.firstPersonPlNeg
            firstPluralAlternateLabel.text = verbParts.firstPersonPlNegAlt
            secondPluralLabel.text = verbParts.secondPersonPlNeg
            thirdPluralLabel.text = verbParts.thirdPersonPlNeg
            thirdPluralAlternateLabel.text = verbParts.thirdPersonPlNegAlt
            
        case 2:
            firstSingularLabel.text = verbParts.firstPersonSingInter
            secondSingularLabel.text = verbParts.secondPersonSingInter
            thirdSingularLabel.text = verbParts.thirdPersonSingInter
            firstPluralLabel.text = verbParts.firstPersonPlInter
            firstPluralAlternateLabel.text = verbParts.firstPersonPlInterAlt
            secondPluralLabel.text = verbParts.secondPersonPlInter
            thirdPluralLabel.text = verbParts.thirdPersonPlInter
            thirdPluralAlternateLabel.text = verbParts.thirdPersonPlInterAlt
            
            
        default:
            firstSingularLabel.text = verbParts.firstPersonSingPos
            secondSingularLabel.text = verbParts.secondPersonSingPos
            thirdSingularLabel.text = verbParts.thirdPersonSingPos
            firstPluralLabel.text = verbParts.firstPersonPlPos
            firstPluralAlternateLabel.text = verbParts.firstPersonPlPosAlt
            secondPluralLabel.text = verbParts.secondPersonPlPos
            thirdPluralLabel.text = verbParts.thirdPersonPlPos
            thirdPluralAlternateLabel.text = verbParts.thirdPersonPlPosAlt
        }

        
    }
    */
    
    
   }
