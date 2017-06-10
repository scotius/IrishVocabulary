//
//  NounTableViewController.swift
//  IrishVocabulary
//
//  Created by Scott on 5/9/17.
//  Copyright © 2017 Scott. All rights reserved.
//

import UIKit
import RealmSwift

class NounTableViewController: UITableViewController {
    
    var keysArray = [String]()
    var entryArray = [Entry]()
    var sectionsArray = [Section]()
    var selectedNoun = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getNounListFromDatabase()
        createSections()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nounCell", for: indexPath)
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
    
    func getNounListFromDatabase() {
        let realm = try! Realm()
        let nounQuery = realm.objects(Noun.self)
        var entryKey = ""
        var entry = Entry()
        
        for noun in nounQuery {
            entry.irish = noun.nominativeSingular
            entry.english = noun.english
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
            //removes duplicates values in keysArray
            keysArray = Array(Set(keysArray))
            //sorts keysArray alphabetically
            keysArray.sort { $0 < $1 }
            entry = Entry()
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
