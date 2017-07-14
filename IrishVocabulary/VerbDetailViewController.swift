//
//  VerbTenseViewController.swift
//  IrishRealm
//
//  Created by Scott on 12/1/16.
//  Copyright © 2016 Scott. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift


class VerbDetailViewController : UIViewController {
    
    
    
    
    
    
    @IBOutlet weak var infinitiveLabel: UILabel!
    
    @IBOutlet weak var englishLabel: UILabel!
    
    @IBOutlet weak var verbalAdjectiveLabel: UILabel!
    
    @IBOutlet weak var verbalNounLabel: UILabel!
    
    var tense = ""
    var verbName = ""
    var verb = Verb()
    var parts = VerbParts()
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

        getVerbFromDatabase()
        self.infinitiveLabel.text = verb.infinitive
        self.englishLabel.text = verb.english
        self.verbalAdjectiveLabel.text = verb.verbalAdjective
        self.verbalNounLabel.text = verb.verbalNoun
        
        
    }
    
    
    
    
    
    
    
    
    func getVerbFromDatabase () {
        
        let realm = try! Realm()
        /*
         takes the verb selected in the Verb tableview and queries it in the Realm
         database. It then seeds the variable called verb with the values of the verb
         for the infinitive selected
         */
        let queryVerb = realm.objects(Verb.self).filter("infinitive = '\(verbName)'")
        
        
        for selection in queryVerb {
            verb.infinitive = selection.infinitive
            verb.english = selection.english
            verb.verbalAdjective = selection.verbalAdjective
            verb.verbalNoun = selection.verbalNoun
            verb.simplePast1stPersonSingPos = selection.simplePast1stPersonSingPos
            verb.simplePast1stPersonSingInter = selection.simplePast1stPersonSingInter
            verb.simplePast1stPersonSingNeg = selection.simplePast1stPersonSingNeg
            verb.simplePast2ndPersonSingPos = selection.simplePast2ndPersonSingPos
            verb.simplePast2ndPersonSingInter = selection.simplePast2ndPersonSingInter
            verb.simplePast2ndPersonSingNeg = selection.simplePast2ndPersonSingNeg
            verb.simplePast3rdPersonSingPos = selection.simplePast3rdPersonSingPos
            verb.simplePast3rdPersonSingInter = selection.simplePast3rdPersonSingInter
            verb.simplePast3rdPersonSingNeg = selection.simplePast3rdPersonSingNeg
            verb.simplePast1stPersonPlPosAlt = selection.simplePast1stPersonPlPosAlt
            verb.simplePast1stPersonPlInterAlt = selection.simplePast1stPersonPlInterAlt
            verb.simplePast1stPersonPlNegAlt = selection.simplePast1stPersonPlNegAlt
            verb.simplePast1stPersonPlPos = selection.simplePast1stPersonPlPos
            verb.simplePast1stPersonPlInter = selection.simplePast1stPersonPlInter
            verb.simplePast1stPersonPlNeg = selection.simplePast1stPersonPlNeg
            verb.simplePast2ndPersonPlPos = selection.simplePast2ndPersonPlPos
            verb.simplePast2ndPersonPlInter = selection.simplePast2ndPersonPlInter
            verb.simplePast2ndPersonPlNeg = selection.simplePast2ndPersonPlNeg
            verb.simplePast3rdPersonPlPos = selection.simplePast3rdPersonPlPos
            verb.simplePast3rdPersonPlInter = selection.simplePast3rdPersonPlInter
            verb.simplePast3rdPersonPlNeg = selection.simplePast3rdPersonPlNeg
            verb.simplePast3rdPersonPlPosAlt = selection.simplePast3rdPersonPlPosAlt
            verb.simplePast3rdPersonPlInterAlt = selection.simplePast3rdPersonPlInterAlt
            verb.simplePast3rdPersonPlNegAlt = selection.simplePast3rdPersonPlNegAlt
            verb.simplePastImpersonalPos = selection.simplePastImpersonalPos
            verb.simplePastImpersonalInter = selection.simplePastImpersonalInter
            verb.simplePastImpersonalNeg = selection.simplePastImpersonalNeg
            
            verb.present1stPersonSingPos = selection.present1stPersonSingPos
            verb.present1stPersonSingInter = selection.present1stPersonSingInter
            verb.present1stPersonSingNeg = selection.present1stPersonSingNeg
            verb.present2ndPersonSingPos = selection.present2ndPersonSingPos
            verb.present2ndPersonSingInter = selection.present2ndPersonSingInter
            verb.present2ndPersonSingNeg = selection.present2ndPersonSingNeg
            verb.present3rdPersonSingPos = selection.present3rdPersonSingPos
            verb.present3rdPersonSingInter = selection.present3rdPersonSingInter
            verb.present3rdPersonSingNeg = selection.present3rdPersonSingNeg
            verb.present1stPersonPlPosAlt = selection.present1stPersonPlPosAlt
            verb.present1stPersonPlInterAlt = selection.present1stPersonPlInterAlt
            verb.present1stPersonPlNegAlt = selection.present1stPersonPlNegAlt
            verb.present1stPersonPlPos = selection.present1stPersonPlPos
            verb.present1stPersonPlInter = selection.present1stPersonPlInter
            verb.present1stPersonPlNeg = selection.present1stPersonPlNeg
            verb.present2ndPersonPlPos = selection.present2ndPersonPlPos
            verb.present2ndPersonPlInter = selection.present2ndPersonPlInter
            verb.present2ndPersonPlNeg = selection.present2ndPersonPlNeg
            verb.present3rdPersonPlPos = selection.present3rdPersonPlPos
            verb.present3rdPersonPlInter = selection.present3rdPersonPlInter
            verb.present3rdPersonPlNeg = selection.present3rdPersonPlNeg
            verb.presentImpersonalPos = selection.presentImpersonalPos
            verb.presentImpersonalInter = selection.presentImpersonalInter
            verb.presentImpersonalNeg = selection.presentImpersonalNeg
            
            verb.future1stPersonSingPos = selection.future1stPersonSingPos
            verb.future1stPersonSingInter = selection.future1stPersonSingInter
            verb.future1stPersonSingNeg = selection.future1stPersonSingNeg
            verb.future2ndPersonSingPos = selection.future2ndPersonSingPos
            verb.future2ndPersonSingInter = selection.future2ndPersonSingInter
            verb.future2ndPersonSingNeg = selection.future2ndPersonSingNeg
            verb.future3rdPersonSingPos = selection.future3rdPersonSingPos
            verb.future3rdPersonSingInter = selection.future3rdPersonSingInter
            verb.future3rdPersonSingNeg = selection.future3rdPersonSingNeg
            verb.future1stPersonPlPosAlt = selection.future1stPersonPlPosAlt
            verb.future1stPersonPlInterAlt = selection.future1stPersonPlInterAlt
            verb.future1stPersonPlNegAlt = selection.future1stPersonPlNegAlt
            verb.future1stPersonPlPos = selection.future1stPersonPlPos
            verb.future1stPersonPlInter = selection.future1stPersonPlInter
            verb.future1stPersonPlNeg = selection.future1stPersonPlNeg
            verb.future2ndPersonPlPos = selection.future2ndPersonPlPos
            verb.future2ndPersonPlInter = selection.future2ndPersonPlInter
            verb.future2ndPersonPlNeg = selection.future2ndPersonPlNeg
            verb.future3rdPersonPlPos = selection.future3rdPersonPlPos
            verb.future3rdPersonPlInter = selection.future3rdPersonPlInter
            verb.future3rdPersonPlNeg = selection.future3rdPersonPlNeg
            verb.futureImpersonalPos = selection.futureImpersonalPos
            verb.futureImpersonalInter = selection.futureImpersonalInter
            verb.futureImpersonalNeg = selection.futureImpersonalNeg
            
            verb.conditional1stPersonSingPos = selection.conditional1stPersonSingPos
            verb.conditional1stPersonSingInter = selection.conditional1stPersonSingInter
            verb.conditional1stPersonSingNeg = selection.conditional1stPersonSingNeg
            verb.conditional2ndPersonSingPos = selection.conditional2ndPersonSingPos
            verb.conditional2ndPersonSingInter = selection.conditional2ndPersonSingInter
            verb.conditional2ndPersonSingNeg = selection.conditional2ndPersonSingNeg
            verb.conditional3rdPersonSingPos = selection.conditional3rdPersonSingPos
            verb.conditional3rdPersonSingInter = selection.conditional3rdPersonSingInter
            verb.conditional3rdPersonSingNeg = selection.conditional3rdPersonSingNeg
            verb.conditional1stPersonPlPosAlt = selection.conditional1stPersonPlPosAlt
            verb.conditional1stPersonPlInterAlt = selection.conditional1stPersonPlInterAlt
            verb.conditional1stPersonPlNegAlt = selection.conditional1stPersonPlNegAlt
            verb.conditional1stPersonPlPos = selection.conditional1stPersonPlPos
            verb.conditional1stPersonPlInter = selection.conditional1stPersonPlInter
            verb.conditional1stPersonPlNeg = selection.conditional1stPersonPlNeg
            verb.conditional2ndPersonPlPos = selection.conditional2ndPersonPlPos
            verb.conditional2ndPersonPlInter = selection.conditional2ndPersonPlInter
            verb.conditional2ndPersonPlNeg = selection.conditional2ndPersonPlNeg
            verb.conditional3rdPersonPlPosAlt = selection.conditional3rdPersonPlPosAlt
            verb.conditional3rdPersonPlInterAlt = selection.conditional3rdPersonPlInterAlt
            verb.conditional3rdPersonPlNegAlt = selection.conditional3rdPersonPlNegAlt
            verb.conditional3rdPersonPlPos = selection.conditional3rdPersonPlPos
            verb.conditional3rdPersonPlInter = selection.conditional3rdPersonPlInter
            verb.conditional3rdPersonPlNeg = selection.conditional3rdPersonPlNeg
            verb.conditionalImpersonalPos = selection.conditionalImpersonalPos
            verb.conditionalImpersonalInter = selection.conditionalImpersonalInter
            verb.conditionalImpersonalNeg = selection.conditionalImpersonalNeg
            
            verb.habitualPast1stPersonSingPos = selection.habitualPast1stPersonSingPos
            verb.habitualPast1stPersonSingInter = selection.habitualPast1stPersonSingInter
            verb.habitualPast1stPersonSingNeg = selection.habitualPast1stPersonSingNeg
            verb.habitualPast2ndPersonSingPos = selection.habitualPast2ndPersonSingPos
            verb.habitualPast2ndPersonSingInter = selection.habitualPast2ndPersonSingInter
            verb.habitualPast2ndPersonSingNeg = selection.habitualPast2ndPersonSingNeg
            verb.habitualPast3rdPersonSingPos = selection.habitualPast3rdPersonSingPos
            verb.habitualPast3rdPersonSingInter = selection.habitualPast3rdPersonSingInter
            verb.habitualPast3rdPersonSingNeg = selection.habitualPast3rdPersonSingNeg
            verb.habitualPast1stPersonPlPosAlt = selection.habitualPast1stPersonPlPosAlt
            verb.habitualPast1stPersonPlInterAlt = selection.habitualPast1stPersonPlInterAlt
            verb.habitualPast1stPersonPlNegAlt = selection.habitualPast1stPersonPlNegAlt
            verb.habitualPast1stPersonPlPos = selection.habitualPast1stPersonPlPos
            verb.habitualPast1stPersonPlInter = selection.habitualPast1stPersonPlInter
            verb.habitualPast1stPersonPlNeg = selection.habitualPast1stPersonPlNeg
            verb.habitualPast2ndPersonPlPos = selection.habitualPast2ndPersonPlPos
            verb.habitualPast2ndPersonPlInter = selection.habitualPast2ndPersonPlInter
            verb.habitualPast2ndPersonPlNeg = selection.habitualPast2ndPersonPlNeg
            verb.habitualPast3rdPersonPlPosAlt = selection.habitualPast3rdPersonPlPosAlt
            verb.habitualPast3rdPersonPlInterAlt = selection.habitualPast3rdPersonPlInterAlt
            verb.habitualPast3rdPersonPlNegAlt = selection.habitualPast3rdPersonPlNegAlt
            verb.habitualPast3rdPersonPlPos = selection.habitualPast3rdPersonPlPos
            verb.habitualPast3rdPersonPlInter = selection.habitualPast3rdPersonPlInter
            verb.habitualPast3rdPersonPlNeg = selection.habitualPast3rdPersonPlNeg
            verb.habitualPastImpersonalPos = selection.habitualPastImpersonalPos
            verb.habitualPastImpersonalInter = selection.habitualPastImpersonalInter
            verb.habitualPastImpersonalNeg = selection.habitualPastImpersonalNeg
            
            verb.imperative1stPersonSingPos = selection.imperative1stPersonSingPos
            verb.imperative1stPersonSingNeg = selection.imperative1stPersonSingNeg
            verb.imperative2ndPersonSingPos = selection.imperative2ndPersonSingPos
            verb.imperative2ndPersonSingNeg = selection.imperative2ndPersonSingNeg
            verb.imperative3rdPersonSingPos = selection.imperative3rdPersonSingPos
            verb.imperative3rdPersonSingNeg = selection.imperative3rdPersonSingNeg
            verb.imperative1stPersonPlPos = selection.imperative1stPersonPlPos
            verb.imperative1stPersonPlNeg = selection.imperative1stPersonPlNeg
            verb.imperative1stPersonPlPosAlt = selection.imperative1stPersonPlPosAlt
            verb.imperative1stPersonPlNegAlt = selection.imperative1stPersonPlNegAlt
            verb.imperative2ndPersonPlPos = selection.imperative2ndPersonPlPos
            verb.imperative2ndPersonPlNeg = selection.imperative2ndPersonPlNeg
            verb.imperative3rdPersonPlPos = selection.imperative3rdPersonPlPos
            verb.imperative3rdPersonPlNeg = selection.imperative3rdPersonPlNeg
            verb.imperative3rdPersonPlPosAlt = selection.imperative3rdPersonPlPosAlt
            verb.imperative3rdPersonPlNegAlt = selection.imperative3rdPersonPlNegAlt
            verb.imperativeImpersonalPos = selection.imperativeImpersonalPos
            verb.imperativeImpersonalNeg = selection.imperativeImpersonalNeg
            
            verb.presentSubjunctive1stPersonSingPos = selection.presentSubjunctive1stPersonSingPos
            verb.presentSubjunctive1stPersonSingNeg = selection.presentSubjunctive1stPersonSingNeg
            verb.presentSubjunctive2ndPersonSingPos = selection.presentSubjunctive2ndPersonSingPos
            verb.presentSubjunctive2ndPersonSingNeg = selection.presentSubjunctive2ndPersonSingNeg
            verb.presentSubjunctive3rdPersonSingPos = selection.presentSubjunctive3rdPersonSingPos
            verb.presentSubjunctive3rdPersonSingNeg = selection.presentSubjunctive3rdPersonSingNeg
            verb.presentSubjunctive1stPersonPlPos = selection.presentSubjunctive1stPersonPlPos
            verb.presentSubjunctive1stPersonPlNeg = selection.presentSubjunctive1stPersonPlNeg
            verb.presentSubjunctive1stPersonPlPosAlt = selection.presentSubjunctive1stPersonPlPosAlt
            verb.presentSubjunctive1stPersonPlNegAlt = selection.presentSubjunctive1stPersonPlNegAlt
            verb.presentSubjunctive2ndPersonPlPos = selection.presentSubjunctive2ndPersonPlPos
            verb.presentSubjunctive2ndPersonPlNeg = selection.presentSubjunctive2ndPersonPlNeg
            verb.presentSubjunctive3rdPersonPlPos = selection.presentSubjunctive3rdPersonPlPos
            verb.presentSubjunctive3rdPersonPlNeg = selection.presentSubjunctive3rdPersonPlNeg
            verb.presentSubjunctiveImpersonalPos = selection.presentSubjunctiveImpersonalPos
            verb.presentSubjunctiveImpersonalNeg = selection.presentSubjunctiveImpersonalNeg
            
            
        }
    }
    
    
    
    
    
    
    @IBAction func simplePastPressed(_ sender: UIButton) {
        
        tense = "simplePast"
        clearTenseSections()
        singularPositiveItems.append(verb.simplePast1stPersonSingPos)
        singularInterrogativeItems.append(verb.simplePast1stPersonSingInter)
        singularNegativeItems.append(verb.simplePast1stPersonSingNeg)
        singularPositiveItems.append(verb.simplePast2ndPersonSingPos)
        singularInterrogativeItems.append(verb.simplePast2ndPersonSingInter)
        singularNegativeItems.append(verb.simplePast2ndPersonSingNeg)
        singularPositiveItems.append(verb.simplePast3rdPersonSingPos)
        singularInterrogativeItems.append(verb.simplePast3rdPersonSingInter)
        singularNegativeItems.append(verb.simplePast3rdPersonSingNeg)
        pluralPositiveItems.append(verb.simplePast1stPersonPlPosAlt)
        pluralInterrogativeItems.append(verb.simplePast1stPersonPlInterAlt)
        pluralNegativeItems.append(verb.simplePast1stPersonPlNegAlt)
        pluralPositiveItems.append(verb.simplePast1stPersonPlPos)
        pluralInterrogativeItems.append(verb.simplePast1stPersonPlInter)
        pluralNegativeItems.append(verb.simplePast1stPersonPlNeg)
        pluralPositiveItems.append(verb.simplePast2ndPersonPlPos)
        pluralInterrogativeItems.append(verb.simplePast2ndPersonPlInter)
        pluralNegativeItems.append(verb.simplePast2ndPersonPlNeg)
        pluralPositiveItems.append(verb.simplePast3rdPersonPlPos)
        pluralInterrogativeItems.append(verb.simplePast3rdPersonPlInter)
        pluralNegativeItems.append(verb.simplePast3rdPersonPlNeg)
        pluralPositiveItems.append(verb.simplePast3rdPersonPlPosAlt)
        pluralInterrogativeItems.append(verb.simplePast3rdPersonPlInterAlt)
        pluralNegativeItems.append(verb.simplePast3rdPersonPlNegAlt)
        impersonalPositiveItems.append(verb.simplePastImpersonalPos)
        impersonalInterrogativeItems.append(verb.simplePastImpersonalInter)
        impersonalNegativeItems.append(verb.simplePastImpersonalNeg)
        

        
        self.performSegue(withIdentifier: "verbDetailToVerbTense", sender: self)
        
        
        
        
        
    }
    
    
    
    
    @IBAction func habitualPastPressed(_ sender: Any) {
        tense = "habitualPast"
        
        clearTenseSections()
        singularPositiveItems.append(verb.habitualPast1stPersonSingPos)
        singularInterrogativeItems.append(verb.habitualPast1stPersonSingInter)
        singularNegativeItems.append(verb.habitualPast1stPersonSingNeg)
        singularPositiveItems.append(verb.habitualPast2ndPersonSingPos)
        singularInterrogativeItems.append(verb.habitualPast2ndPersonSingInter)
        singularNegativeItems.append(verb.habitualPast2ndPersonSingNeg)
        singularPositiveItems.append(verb.habitualPast3rdPersonSingPos)
        singularInterrogativeItems.append(verb.habitualPast3rdPersonSingInter)
        singularNegativeItems.append(verb.habitualPast3rdPersonSingNeg)
        pluralPositiveItems.append(verb.habitualPast1stPersonPlPosAlt)
        pluralInterrogativeItems.append(verb.habitualPast1stPersonPlInterAlt)
        pluralNegativeItems.append(verb.habitualPast1stPersonPlNegAlt)
        pluralPositiveItems.append(verb.habitualPast1stPersonPlPos)
        pluralInterrogativeItems.append(verb.habitualPast1stPersonPlInter)
        pluralNegativeItems.append(verb.habitualPast1stPersonPlNeg)
        pluralPositiveItems.append(verb.habitualPast2ndPersonPlPos)
        pluralInterrogativeItems.append(verb.habitualPast2ndPersonPlInter)
        pluralNegativeItems.append(verb.habitualPast2ndPersonPlNeg)
        pluralPositiveItems.append(verb.habitualPast3rdPersonPlPos)
        pluralInterrogativeItems.append(verb.habitualPast3rdPersonPlInter)
        pluralNegativeItems.append(verb.habitualPast3rdPersonPlNeg)
        pluralPositiveItems.append(verb.habitualPast3rdPersonPlPosAlt)
        pluralInterrogativeItems.append(verb.habitualPast3rdPersonPlInterAlt)
        pluralNegativeItems.append(verb.habitualPast3rdPersonPlNegAlt)
        impersonalPositiveItems.append(verb.habitualPastImpersonalPos)
        impersonalInterrogativeItems.append(verb.habitualPastImpersonalInter)
        impersonalNegativeItems.append(verb.habitualPastImpersonalNeg)
        
        self.performSegue(withIdentifier: "verbDetailToVerbTense", sender: self)
    }
    
    
    
    @IBAction func presentPressed(_ sender: Any) {
        
        tense = "present"
        
        clearTenseSections()
        singularPositiveItems.append(verb.present1stPersonSingPos)
        singularInterrogativeItems.append(verb.present1stPersonSingInter)
        singularNegativeItems.append(verb.present1stPersonSingNeg)
        singularPositiveItems.append(verb.present2ndPersonSingPos)
        singularInterrogativeItems.append(verb.present2ndPersonSingInter)
        singularNegativeItems.append(verb.present2ndPersonSingNeg)
        singularPositiveItems.append(verb.present3rdPersonSingPos)
        singularInterrogativeItems.append(verb.present3rdPersonSingInter)
        singularNegativeItems.append(verb.present3rdPersonSingNeg)
        pluralPositiveItems.append(verb.present1stPersonPlPosAlt)
        pluralInterrogativeItems.append(verb.present1stPersonPlInterAlt)
        pluralNegativeItems.append(verb.present1stPersonPlNegAlt)
        pluralPositiveItems.append(verb.present1stPersonPlPos)
        pluralInterrogativeItems.append(verb.present1stPersonPlInter)
        pluralNegativeItems.append(verb.present1stPersonPlNeg)
        pluralPositiveItems.append(verb.present2ndPersonPlPos)
        pluralInterrogativeItems.append(verb.present2ndPersonPlInter)
        pluralNegativeItems.append(verb.present2ndPersonPlNeg)
        pluralPositiveItems.append(verb.present3rdPersonPlPos)
        pluralInterrogativeItems.append(verb.present3rdPersonPlInter)
        pluralNegativeItems.append(verb.present3rdPersonPlNeg)
        impersonalPositiveItems.append(verb.presentImpersonalPos)
        impersonalInterrogativeItems.append(verb.presentImpersonalInter)
        impersonalNegativeItems.append(verb.presentImpersonalNeg)
        
        self.performSegue(withIdentifier: "verbDetailToVerbTense", sender: self)
        
    }
    
    
    @IBAction func futurePressed(_ sender: Any) {
        
        tense = "future"
        
        clearTenseSections()
        singularPositiveItems.append(verb.future1stPersonSingPos)
        singularInterrogativeItems.append(verb.future1stPersonSingInter)
        singularNegativeItems.append(verb.future1stPersonSingNeg)
        singularPositiveItems.append(verb.future2ndPersonSingPos)
        singularInterrogativeItems.append(verb.future2ndPersonSingInter)
        singularNegativeItems.append(verb.future2ndPersonSingNeg)
        singularPositiveItems.append(verb.future3rdPersonSingPos)
        singularInterrogativeItems.append(verb.future3rdPersonSingInter)
        singularNegativeItems.append(verb.future3rdPersonSingNeg)
        pluralPositiveItems.append(verb.future1stPersonPlPosAlt)
        pluralInterrogativeItems.append(verb.future1stPersonPlInterAlt)
        pluralNegativeItems.append(verb.future1stPersonPlNegAlt)
        pluralPositiveItems.append(verb.future1stPersonPlPos)
        pluralInterrogativeItems.append(verb.future1stPersonPlInter)
        pluralNegativeItems.append(verb.future1stPersonPlNeg)
        pluralPositiveItems.append(verb.future2ndPersonPlPos)
        pluralInterrogativeItems.append(verb.future2ndPersonPlInter)
        pluralNegativeItems.append(verb.future2ndPersonPlNeg)
        pluralPositiveItems.append(verb.future3rdPersonPlPos)
        pluralInterrogativeItems.append(verb.future3rdPersonPlInter)
        pluralNegativeItems.append(verb.future3rdPersonPlNeg)
        impersonalPositiveItems.append(verb.futureImpersonalPos)
        impersonalInterrogativeItems.append(verb.futureImpersonalInter)
        impersonalNegativeItems.append(verb.futureImpersonalNeg)
        
        self.performSegue(withIdentifier: "verbDetailToVerbTense", sender: self)
        
    }
    
    
    @IBAction func conditionalPressed(_ sender: Any) {
        
        tense = "conditional"

        clearTenseSections()
        singularPositiveItems.append(verb.conditional1stPersonSingPos)
        singularInterrogativeItems.append(verb.conditional1stPersonSingInter)
        singularNegativeItems.append(verb.conditional1stPersonSingNeg)
        singularPositiveItems.append(verb.conditional2ndPersonSingPos)
        singularInterrogativeItems.append(verb.conditional2ndPersonSingInter)
        singularNegativeItems.append(verb.conditional2ndPersonSingNeg)
        singularPositiveItems.append(verb.conditional3rdPersonSingPos)
        singularInterrogativeItems.append(verb.conditional3rdPersonSingInter)
        singularNegativeItems.append(verb.conditional3rdPersonSingNeg)
        pluralPositiveItems.append(verb.conditional1stPersonPlPosAlt)
        pluralInterrogativeItems.append(verb.conditional1stPersonPlInterAlt)
        pluralNegativeItems.append(verb.conditional1stPersonPlNegAlt)
        pluralPositiveItems.append(verb.conditional1stPersonPlPos)
        pluralInterrogativeItems.append(verb.conditional1stPersonPlInter)
        pluralNegativeItems.append(verb.conditional1stPersonPlNeg)
        pluralPositiveItems.append(verb.conditional2ndPersonPlPos)
        pluralInterrogativeItems.append(verb.conditional2ndPersonPlInter)
        pluralNegativeItems.append(verb.conditional2ndPersonPlNeg)
        pluralPositiveItems.append(verb.conditional3rdPersonPlPos)
        pluralInterrogativeItems.append(verb.conditional3rdPersonPlInter)
        pluralNegativeItems.append(verb.conditional3rdPersonPlNeg)
        pluralPositiveItems.append(verb.conditional3rdPersonPlPosAlt)
        pluralInterrogativeItems.append(verb.conditional3rdPersonPlInterAlt)
        pluralNegativeItems.append(verb.conditional3rdPersonPlNegAlt)
        impersonalPositiveItems.append(verb.conditionalImpersonalPos)
        impersonalInterrogativeItems.append(verb.conditionalImpersonalInter)
        impersonalNegativeItems.append(verb.conditionalImpersonalNeg)
        
        self.performSegue(withIdentifier: "verbDetailToVerbTense", sender: self)
        
    }
    
    
    @IBAction func presentSubjunctivePressed(_ sender: Any) {
        
        tense = "presentSubjunctive"
        
        clearTenseSections()
        singularPositiveItems.append(verb.presentSubjunctive1stPersonSingPos)
        singularNegativeItems.append(verb.presentSubjunctive1stPersonSingNeg)
        singularPositiveItems.append(verb.presentSubjunctive2ndPersonSingPos)
        singularNegativeItems.append(verb.presentSubjunctive2ndPersonSingNeg)
        singularPositiveItems.append(verb.presentSubjunctive3rdPersonSingPos)
        singularNegativeItems.append(verb.presentSubjunctive3rdPersonSingNeg)
        pluralPositiveItems.append(verb.presentSubjunctive1stPersonPlPosAlt)
        pluralNegativeItems.append(verb.presentSubjunctive1stPersonPlNegAlt)
        pluralPositiveItems.append(verb.presentSubjunctive1stPersonPlPos)
        pluralNegativeItems.append(verb.presentSubjunctive1stPersonPlNeg)
        pluralPositiveItems.append(verb.presentSubjunctive2ndPersonPlPos)
        pluralNegativeItems.append(verb.presentSubjunctive2ndPersonPlNeg)
        pluralPositiveItems.append(verb.presentSubjunctive3rdPersonPlPos)
        pluralNegativeItems.append(verb.presentSubjunctive3rdPersonPlNeg)
        impersonalPositiveItems.append(verb.presentSubjunctiveImpersonalPos)
        impersonalNegativeItems.append(verb.presentSubjunctiveImpersonalNeg)
        
        self.performSegue(withIdentifier: "verbDetailToVerbMood", sender: self)
    }
    
    
    @IBAction func imperativePressed(_ sender: Any) {
        
        tense = "imperative"
  
        clearTenseSections()
        singularPositiveItems.append(verb.imperative1stPersonSingPos)
        singularNegativeItems.append(verb.imperative1stPersonSingNeg)
        singularPositiveItems.append(verb.imperative2ndPersonSingPos)
        singularNegativeItems.append(verb.imperative2ndPersonSingNeg)
        singularPositiveItems.append(verb.imperative3rdPersonSingPos)
        singularNegativeItems.append(verb.imperative3rdPersonSingNeg)
        pluralPositiveItems.append(verb.imperative1stPersonPlPosAlt)
        pluralNegativeItems.append(verb.imperative1stPersonPlNegAlt)
        pluralPositiveItems.append(verb.imperative1stPersonPlPos)
        pluralNegativeItems.append(verb.imperative1stPersonPlNeg)
        pluralPositiveItems.append(verb.imperative2ndPersonPlPos)
        pluralNegativeItems.append(verb.imperative2ndPersonPlNeg)
        pluralPositiveItems.append(verb.imperative3rdPersonPlPos)
        pluralNegativeItems.append(verb.imperative3rdPersonPlNeg)
        pluralPositiveItems.append(verb.imperative3rdPersonPlPosAlt)
        pluralNegativeItems.append(verb.imperative3rdPersonPlNegAlt)
        impersonalPositiveItems.append(verb.imperativeImpersonalPos)
        impersonalNegativeItems.append(verb.imperativeImpersonalNeg)
        
        self.performSegue(withIdentifier: "verbDetailToVerbMood", sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "verbDetailToVerbTense" {
            let tenseVC = segue.destination as! VerbTenseViewController
            tenseVC.verb = self.verb
            tenseVC.tense = self.tense
            tenseVC.parts = self.parts
            tenseVC.singularPositiveItems = self.singularPositiveItems
            tenseVC.singularNegativeItems = self.singularNegativeItems
            tenseVC.singularInterrogativeItems = self.singularInterrogativeItems
            tenseVC.pluralPositiveItems = self.pluralPositiveItems
            tenseVC.pluralNegativeItems = self.pluralNegativeItems
            tenseVC.pluralInterrogativeItems = self.pluralInterrogativeItems
            tenseVC.impersonalPositiveItems = self.impersonalPositiveItems
            tenseVC.impersonalNegativeItems = self.impersonalNegativeItems
            tenseVC.impersonalInterrogativeItems = self.impersonalInterrogativeItems
}
        
        else if segue.identifier == "verbDetailToVerbMood" {
            
            let moodVC = segue.destination as! VerbMoodViewController
            moodVC.verb = self.verb
            moodVC.tense = self.tense
            moodVC.parts = self.parts
            moodVC.singularPositiveItems = self.singularPositiveItems
            moodVC.singularNegativeItems = self.singularNegativeItems
            moodVC.pluralPositiveItems = self.pluralPositiveItems
            moodVC.pluralNegativeItems = self.pluralNegativeItems
            moodVC.pluralInterrogativeItems = self.pluralInterrogativeItems
            moodVC.impersonalPositiveItems = self.impersonalPositiveItems
            moodVC.impersonalNegativeItems = self.impersonalNegativeItems
           

            
            
        }
        
        
    }
    
    func clearTenseSections() {
        singularPositiveItems.removeAll()
        singularNegativeItems.removeAll()
        singularInterrogativeItems.removeAll()
        pluralPositiveItems.removeAll()
        pluralNegativeItems.removeAll()
        pluralInterrogativeItems.removeAll()
        impersonalPositiveItems.removeAll()
        impersonalNegativeItems.removeAll()
        impersonalInterrogativeItems.removeAll()                 
    }
    
    
    
}




