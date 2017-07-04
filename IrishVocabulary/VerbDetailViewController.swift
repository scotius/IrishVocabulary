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
    var singularItems = [String]()
    var pluralItems = [String]()
    var impersonalItems = [String]()
    
    
    
    
    
    
    
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
        singularItems.removeAll()
        pluralItems.removeAll()
        impersonalItems.removeAll()
        singularItems.append(verb.simplePast1stPersonSingPos)
        singularItems.append(verb.simplePast1stPersonSingInter)
        singularItems.append(verb.simplePast1stPersonSingNeg)
        singularItems.append(verb.simplePast2ndPersonSingPos)
        singularItems.append(verb.simplePast2ndPersonSingInter)
        singularItems.append(verb.simplePast2ndPersonSingNeg)
        singularItems.append(verb.simplePast3rdPersonSingPos)
        singularItems.append(verb.simplePast3rdPersonSingInter)
        singularItems.append(verb.simplePast3rdPersonSingNeg)
        pluralItems.append(verb.simplePast1stPersonPlPosAlt)
        pluralItems.append(verb.simplePast1stPersonPlInterAlt)
        pluralItems.append(verb.simplePast1stPersonPlNegAlt)
        pluralItems.append(verb.simplePast1stPersonPlPos)
        pluralItems.append(verb.simplePast1stPersonPlInter)
        pluralItems.append(verb.simplePast1stPersonPlNeg)
        pluralItems.append(verb.simplePast2ndPersonPlPos)
        pluralItems.append(verb.simplePast2ndPersonPlInter)
        pluralItems.append(verb.simplePast2ndPersonPlNeg)
        pluralItems.append(verb.simplePast3rdPersonPlPos)
        pluralItems.append(verb.simplePast3rdPersonPlInter)
        pluralItems.append(verb.simplePast3rdPersonPlNeg)
        pluralItems.append(verb.simplePast3rdPersonPlPosAlt)
        pluralItems.append(verb.simplePast3rdPersonPlInterAlt)
        pluralItems.append(verb.simplePast3rdPersonPlNegAlt)
        impersonalItems.append(verb.simplePastImpersonalPos)
        impersonalItems.append(verb.simplePastImpersonalInter)
        impersonalItems.append(verb.simplePastImpersonalNeg)
        

        
        self.performSegue(withIdentifier: "verbDetailToVerbTense", sender: self)
        
        
        
        
        
    }
    
    
    
    
    @IBAction func habitualPastPressed(_ sender: Any) {
        
        tense = "habitualPast"
        singularItems.removeAll()
        pluralItems.removeAll()
        impersonalItems.removeAll()
        singularItems.append(verb.habitualPast1stPersonSingPos)
        singularItems.append(verb.habitualPast1stPersonSingInter)
        singularItems.append(verb.habitualPast1stPersonSingNeg)
        singularItems.append(verb.habitualPast2ndPersonSingPos)
        singularItems.append(verb.habitualPast2ndPersonSingInter)
        singularItems.append(verb.habitualPast2ndPersonSingNeg)
        singularItems.append(verb.habitualPast3rdPersonSingPos)
        singularItems.append(verb.habitualPast3rdPersonSingInter)
        singularItems.append(verb.habitualPast3rdPersonSingNeg)
        pluralItems.append(verb.habitualPast1stPersonPlPosAlt)
        pluralItems.append(verb.habitualPast1stPersonPlInterAlt)
        pluralItems.append(verb.habitualPast1stPersonPlNegAlt)
        pluralItems.append(verb.habitualPast1stPersonPlPos)
        pluralItems.append(verb.habitualPast1stPersonPlInter)
        pluralItems.append(verb.habitualPast1stPersonPlNeg)
        pluralItems.append(verb.habitualPast2ndPersonPlPos)
        pluralItems.append(verb.habitualPast2ndPersonPlInter)
        pluralItems.append(verb.habitualPast2ndPersonPlNeg)
        pluralItems.append(verb.habitualPast3rdPersonPlPos)
        pluralItems.append(verb.habitualPast3rdPersonPlInter)
        pluralItems.append(verb.habitualPast3rdPersonPlNeg)
        pluralItems.append(verb.habitualPast3rdPersonPlPosAlt)
        pluralItems.append(verb.habitualPast3rdPersonPlInterAlt)
        pluralItems.append(verb.habitualPast3rdPersonPlNegAlt)
        impersonalItems.append(verb.habitualPastImpersonalPos)
        impersonalItems.append(verb.habitualPastImpersonalInter)
        impersonalItems.append(verb.habitualPastImpersonalNeg)
        
        
        self.performSegue(withIdentifier: "verbDetailToVerbTense", sender: self)
    }
    
    
    
    @IBAction func presentPressed(_ sender: Any) {
        
        tense = "present"
        singularItems.removeAll()
        pluralItems.removeAll()
        impersonalItems.removeAll()
        singularItems.append(verb.present1stPersonSingPos)
        singularItems.append(verb.present1stPersonSingInter)
        singularItems.append(verb.present1stPersonSingNeg)
        singularItems.append(verb.present2ndPersonSingPos)
        singularItems.append(verb.present2ndPersonSingInter)
        singularItems.append(verb.present2ndPersonSingNeg)
        singularItems.append(verb.present3rdPersonSingPos)
        singularItems.append(verb.present3rdPersonSingInter)
        singularItems.append(verb.present3rdPersonSingNeg)
        pluralItems.append(verb.present1stPersonPlPosAlt)
        pluralItems.append(verb.present1stPersonPlInterAlt)
        pluralItems.append(verb.present1stPersonPlNegAlt)
        pluralItems.append(verb.present1stPersonPlPos)
        pluralItems.append(verb.present1stPersonPlInter)
        pluralItems.append(verb.present1stPersonPlNeg)
        pluralItems.append(verb.present2ndPersonPlPos)
        pluralItems.append(verb.present2ndPersonPlInter)
        pluralItems.append(verb.present2ndPersonPlNeg)
        pluralItems.append(verb.present3rdPersonPlPos)
        pluralItems.append(verb.present3rdPersonPlInter)
        pluralItems.append(verb.present3rdPersonPlNeg)
        impersonalItems.append(verb.presentImpersonalPos)
        impersonalItems.append(verb.presentImpersonalInter)
        impersonalItems.append(verb.presentImpersonalNeg)
        
        
        self.performSegue(withIdentifier: "verbDetailToVerbTense", sender: self)
        
    }
    
    
    @IBAction func futurePressed(_ sender: Any) {
        
        tense = "future"
        singularItems.removeAll()
        pluralItems.removeAll()
        impersonalItems.removeAll()
        singularItems.append(verb.future1stPersonSingPos)
        singularItems.append(verb.future1stPersonSingInter)
        singularItems.append(verb.future1stPersonSingNeg)
        singularItems.append(verb.future2ndPersonSingPos)
        singularItems.append(verb.future2ndPersonSingInter)
        singularItems.append(verb.future2ndPersonSingNeg)
        singularItems.append(verb.future3rdPersonSingPos)
        singularItems.append(verb.future3rdPersonSingInter)
        singularItems.append(verb.future3rdPersonSingNeg)
        pluralItems.append(verb.future1stPersonPlPosAlt)
        pluralItems.append(verb.future1stPersonPlInterAlt)
        pluralItems.append(verb.future1stPersonPlNegAlt)
        pluralItems.append(verb.future1stPersonPlPos)
        pluralItems.append(verb.future1stPersonPlInter)
        pluralItems.append(verb.future1stPersonPlNeg)
        pluralItems.append(verb.future2ndPersonPlPos)
        pluralItems.append(verb.future2ndPersonPlInter)
        pluralItems.append(verb.future2ndPersonPlNeg)
        pluralItems.append(verb.future3rdPersonPlPos)
        pluralItems.append(verb.future3rdPersonPlInter)
        pluralItems.append(verb.future3rdPersonPlNeg)
        impersonalItems.append(verb.futureImpersonalPos)
        impersonalItems.append(verb.futureImpersonalInter)
        impersonalItems.append(verb.futureImpersonalNeg)
        
        
        self.performSegue(withIdentifier: "verbDetailToVerbTense", sender: self)
        
    }
    
    
    @IBAction func conditionalPressed(_ sender: Any) {
        
        tense = "conditional"
        singularItems.removeAll()
        pluralItems.removeAll()
        impersonalItems.removeAll()
        singularItems.append(verb.conditional1stPersonSingPos)
        singularItems.append(verb.conditional1stPersonSingInter)
        singularItems.append(verb.conditional1stPersonSingNeg)
        singularItems.append(verb.conditional2ndPersonSingPos)
        singularItems.append(verb.conditional2ndPersonSingInter)
        singularItems.append(verb.conditional2ndPersonSingNeg)
        singularItems.append(verb.conditional3rdPersonSingPos)
        singularItems.append(verb.conditional3rdPersonSingInter)
        singularItems.append(verb.conditional3rdPersonSingNeg)
        pluralItems.append(verb.conditional1stPersonPlPosAlt)
        pluralItems.append(verb.conditional1stPersonPlInterAlt)
        pluralItems.append(verb.conditional1stPersonPlNegAlt)
        pluralItems.append(verb.conditional1stPersonPlPos)
        pluralItems.append(verb.conditional1stPersonPlInter)
        pluralItems.append(verb.conditional1stPersonPlNeg)
        pluralItems.append(verb.conditional2ndPersonPlPos)
        pluralItems.append(verb.conditional2ndPersonPlInter)
        pluralItems.append(verb.conditional2ndPersonPlNeg)
        pluralItems.append(verb.conditional3rdPersonPlPos)
        pluralItems.append(verb.conditional3rdPersonPlInter)
        pluralItems.append(verb.conditional3rdPersonPlNeg)
        pluralItems.append(verb.conditional3rdPersonPlPosAlt)
        pluralItems.append(verb.conditional3rdPersonPlInterAlt)
        pluralItems.append(verb.conditional3rdPersonPlNegAlt)
        impersonalItems.append(verb.conditionalImpersonalPos)
        impersonalItems.append(verb.conditionalImpersonalInter)
        impersonalItems.append(verb.conditionalImpersonalNeg)
        self.performSegue(withIdentifier: "verbDetailToVerbTense", sender: self)
        
    }
    
    
    @IBAction func presentSubjunctivePressed(_ sender: Any) {
        
        tense = "presentSubjunctive"
        singularItems.removeAll()
        pluralItems.removeAll()
        impersonalItems.removeAll()
        singularItems.append(verb.presentSubjunctive1stPersonSingPos)
        singularItems.append(verb.presentSubjunctive1stPersonSingNeg)
        singularItems.append(verb.presentSubjunctive2ndPersonSingPos)
        singularItems.append(verb.presentSubjunctive2ndPersonSingNeg)
        singularItems.append(verb.presentSubjunctive3rdPersonSingPos)
        singularItems.append(verb.presentSubjunctive3rdPersonSingNeg)
        pluralItems.append(verb.presentSubjunctive1stPersonPlPosAlt)
        pluralItems.append(verb.presentSubjunctive1stPersonPlNegAlt)
        pluralItems.append(verb.presentSubjunctive1stPersonPlPos)
        pluralItems.append(verb.presentSubjunctive1stPersonPlNeg)
        pluralItems.append(verb.presentSubjunctive2ndPersonPlPos)
        pluralItems.append(verb.presentSubjunctive2ndPersonPlNeg)
        pluralItems.append(verb.presentSubjunctive3rdPersonPlPos)
        pluralItems.append(verb.presentSubjunctive3rdPersonPlNeg)
        impersonalItems.append(verb.presentSubjunctiveImpersonalPos)
        impersonalItems.append(verb.presentSubjunctiveImpersonalNeg)
        self.performSegue(withIdentifier: "verbDetailToVerbTense", sender: self)
    }
    
    
    @IBAction func imperativePressed(_ sender: Any) {
        tense = "imperative"
        singularItems.removeAll()
        pluralItems.removeAll()
        impersonalItems.removeAll()
        singularItems.append(verb.imperative1stPersonSingPos)
        singularItems.append(verb.imperative1stPersonSingNeg)
        singularItems.append(verb.imperative2ndPersonSingPos)
        singularItems.append(verb.imperative2ndPersonSingNeg)
        singularItems.append(verb.imperative3rdPersonSingPos)
        singularItems.append(verb.imperative3rdPersonSingNeg)
        pluralItems.append(verb.imperative1stPersonPlPosAlt)
        pluralItems.append(verb.imperative1stPersonPlNegAlt)
        pluralItems.append(verb.imperative1stPersonPlPos)
        pluralItems.append(verb.imperative1stPersonPlNeg)
        pluralItems.append(verb.imperative2ndPersonPlPos)
        pluralItems.append(verb.imperative2ndPersonPlNeg)
        pluralItems.append(verb.imperative3rdPersonPlPos)
        pluralItems.append(verb.imperative3rdPersonPlNeg)
        pluralItems.append(verb.imperative3rdPersonPlPosAlt)
        pluralItems.append(verb.imperative3rdPersonPlNegAlt)
        impersonalItems.append(verb.imperativeImpersonalPos)
        impersonalItems.append(verb.imperativeImpersonalNeg)
        self.performSegue(withIdentifier: "verbDetailToVerbTense", sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "verbDetailToVerbTense"{
            let detailVC = segue.destination as! VerbTenseTableViewController
            detailVC.verb = self.verb
            detailVC.tense = self.tense
            detailVC.singularItems = self.singularItems
            detailVC.pluralItems = self.pluralItems
            detailVC.impersonalItems = self.impersonalItems
            
            
        }
        
        
    }
    
    
    
    
    
}




