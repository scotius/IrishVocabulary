//
//  AdjectiveTableViewController.swift
//  IrishVocabulary
//
//  Created by Scott on 6/1/17.
//  Copyright © 2017 Scott. All rights reserved.
//

import Foundation
import RealmSwift

class AdjectiveTableViewController: UITableViewController {
    
    var keysArray = [String]()
    var entryArray = [Entry]()
    var sectionsArray = [Section]()
    var selectedAdjective = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAdjectiveListFromDatabase()
        createSections()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedAdjective =  sectionsArray[indexPath.section].entry[indexPath.row].irish
        print("Selected adjective is \(selectedAdjective)")
        //self.selectedAdjective =  sectionsArray[indexPath.section].entry[indexPath.row].irish
        
        self.performSegue(withIdentifier: "adjectiveToAdjectiveDetail", sender: self)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "adjectiveCell", for: indexPath)
        cell.textLabel?.text = sectionsArray[indexPath.section].entry[indexPath.row].irish
        cell.detailTextLabel?.text = sectionsArray[indexPath.section].entry[indexPath.row].english
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionsArray[section].entry.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsArray.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keysArray[section]
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return keysArray
    }
    
    func getAdjectiveListFromDatabase() {
        let realm = try! Realm()
        let adjectiveQuery = realm.objects(Adjective.self)
        var entryKey = ""
        var entry = Entry()
        
        for adjective in adjectiveQuery {
            entry.irish = adjective.nominativeSingularMasculine
            entry.english = adjective.english
            let firstLetterIndex = entry.irish.index(entry.irish.startIndex, offsetBy: 1)
            entryKey = entry.irish.substring(to: firstLetterIndex).uppercased()
            
            switch  entryKey {
            case "Á":
                entry.key = "A"
            case "É":
                entry.key = "E"
            case "Í":
                entry.key = "I"
            case "Ó":
                entry.key = "O"
            case "Ú":
                entry.key = "U"
            default:
                entry.key = entryKey
            }
            entryArray.append(entry)
            keysArray.append(entry.key)
            //removes duplicate values in keysArray
            keysArray = Array(Set(keysArray))
            //sorts keysArray alphabetically
            keysArray.sort { $0 < $1 }
            entry = Entry()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "adjectiveToAdjectiveDetail" {
            let detailVC = segue.destination as! AdjectiveDetailViewController
            detailVC.selectedAdjective = self.selectedAdjective
            
           //print("detailVC selected adjective is \(detailVC.selectedAdjective)")
        }
    }
    
    
    func createSections() {
        
        for title in keysArray {
            //create a section by taking a title and adding any entries that begin with that letter
            let section = Section(heading: title, entry: entryArray.filter({$0.key == title}))
            sectionsArray.append(section)
        }
        
        
    }
    
}
