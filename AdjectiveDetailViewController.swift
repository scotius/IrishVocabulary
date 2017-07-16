//
//  AdjectiveDetailViewController.swift
//  IrishVocabulary
//
//  Created by Scott on 7/14/17.
//  Copyright © 2017 Scott. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class AdjectiveDetailViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var irishLabel: UILabel!
    
    @IBOutlet weak var englishLabel: UILabel!
    
    @IBOutlet weak var declensionLabel: UILabel!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var detailSectionsArray = [AdjectiveDetailSection]()
    var selectedAdjective = ""
    var adjective = Adjective()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        print("Selected adjective is \(selectedAdjective)")
        
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        getAdjectiveFromDatabase()
        createDetailSections()
        
        
        
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "adjectiveDetailCell", for: indexPath)
        
        cell.textLabel?.text = detailSectionsArray[indexPath.section].item
        return cell
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return detailSectionsArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return detailSectionsArray[section].heading
    }
    
    func createDetailSections() {
        
        irishLabel.text = adjective.nominativeSingularMasculine
        englishLabel.text = adjective.english
        declensionLabel.text = adjective.declension
        
        let nominativeSingularMasculineSection =  AdjectiveDetailSection()
        nominativeSingularMasculineSection.heading = "Nominative Singular Masculine"
        nominativeSingularMasculineSection.item = adjective.nominativeSingularMasculine
        
        let nominativeSingularFeminineSection =  AdjectiveDetailSection()
        nominativeSingularFeminineSection.heading = "Nominative Singular Feminine"
        nominativeSingularFeminineSection.item = adjective.nominativeSingularFeminine
        
        let genitiveSingularMasculineSection =  AdjectiveDetailSection()
        genitiveSingularMasculineSection.heading = "Genitive Singular Masculine"
        genitiveSingularMasculineSection.item = adjective.genitiveSingularMasculine
        
        let genitiveSingularFeminineSection =  AdjectiveDetailSection()
        genitiveSingularFeminineSection.heading = "Genitive Singular Feminine"
        genitiveSingularFeminineSection.item = adjective.genitiveSingularFeminine
        
        let nominativePluralSection =  AdjectiveDetailSection()
        nominativePluralSection.heading = "Nominative Plural"
        nominativePluralSection.item = adjective.nominativePlural
        
        let nominativePluralSlenderConsonantsSection =  AdjectiveDetailSection()
        nominativePluralSlenderConsonantsSection.heading = "Nominative  Plural Slender Consonants"
        nominativePluralSlenderConsonantsSection.item = adjective.nominativePluralSlenderConsonants
        
        let genitivePluralStrongPluralsSection =  AdjectiveDetailSection()
        genitivePluralStrongPluralsSection.heading = "Genitive Plural Strong Plurals"
        genitivePluralStrongPluralsSection.item = adjective.genitivePluralStrongPlurals
        
        let genitivePluralWeakPluralsSection =  AdjectiveDetailSection()
        genitivePluralWeakPluralsSection.heading = "Genitive Plural Weak Plurals"
        genitivePluralWeakPluralsSection.item = adjective.genitivePluralWeakPlurals
        
        let comparativePresentSection =  AdjectiveDetailSection()
        comparativePresentSection.heading = "Comparative Present"
        comparativePresentSection.item = adjective.comparativePresent
        
        let superlativePresentSection =  AdjectiveDetailSection()
        superlativePresentSection.heading = "Superlative Present"
        superlativePresentSection.item = adjective.superlativePresent
        
        
        detailSectionsArray.append(nominativeSingularMasculineSection)
        detailSectionsArray.append(nominativeSingularFeminineSection)
        detailSectionsArray.append(genitiveSingularMasculineSection)
        detailSectionsArray.append(genitiveSingularFeminineSection)
        detailSectionsArray.append(nominativePluralSection)
        detailSectionsArray.append(nominativePluralSlenderConsonantsSection)
        detailSectionsArray.append(genitivePluralStrongPluralsSection)
        detailSectionsArray.append(genitivePluralWeakPluralsSection)
        detailSectionsArray.append(comparativePresentSection)
        detailSectionsArray.append(superlativePresentSection)
    }

    func getAdjectiveFromDatabase() {
        
        let realm = try! Realm()
        /*
         takes the noun selected in the noun tableview and queries it in the Realm
         database. It then seeds the variable called noun with the values of the noun
         for the nominative singular selected
         */
        let queryAdjective = realm.objects(Adjective.self).filter("nominativeSingularMasculine = '\(selectedAdjective)'")
        
        
        for selection in queryAdjective {
            adjective.nominativeSingularMasculine = selection.nominativeSingularMasculine
            adjective.nominativeSingularFeminine = selection.nominativeSingularFeminine
            adjective.genitiveSingularMasculine = selection.genitiveSingularMasculine
            adjective.genitiveSingularFeminine = selection.genitiveSingularFeminine
            adjective.nominativePlural = selection.nominativePlural
            adjective.nominativePluralSlenderConsonants = selection.nominativePluralSlenderConsonants
            adjective.genitivePluralStrongPlurals = selection.genitivePluralStrongPlurals
            adjective.genitivePluralWeakPlurals = selection.genitivePluralWeakPlurals
            adjective.comparativePresent = selection.comparativePresent
            adjective.superlativePresent = selection.superlativePresent
            adjective.english = selection.english
            adjective.declension = selection.declension
            
            
            
        }
        
    }

    
    
}
