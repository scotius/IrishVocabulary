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
    
    
    //    @IBOutlet weak var infinitiveLabel: UILabel!
    //    @IBOutlet weak var englishLabel: UILabel!
    //    @IBOutlet weak var verbalAdjectiveLabel: UILabel!
    //    @IBOutlet weak var verbalNounLabel: UILabel!
    
    
    
    @IBOutlet weak var infinitiveLabel: UILabel!
    
    @IBOutlet weak var englishLabel: UILabel!
    
    @IBOutlet weak var verbalAdjectiveLabel: UILabel!
    
    @IBOutlet weak var verbalNounLabel: UILabel!
    
    var tense = ""
    var verbName = ""
    var verb = Verb()
    var verbTense = [String]()
    
    
    
    
    
    
    
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
    
    
    
    //
    //
    //  habitualPast
    //     simplePast
    //  present
    //    future
    //    conditional
    //    habitualPast
    //    imperative
    //    presentSubjunctive
    
    
    @IBAction func simplePastPressed(_ sender: UIButton) {
        
        verbTense.append(verb.simplePast1stPersonSingPos)
        verbTense.append(verb.simplePast1stPersonSingInter)
        verbTense.append(verb.simplePast1stPersonSingNeg)
        verbTense.append(verb.simplePast2ndPersonSingPos)
        verbTense.append(verb.simplePast2ndPersonSingInter)
        verbTense.append(verb.simplePast2ndPersonSingNeg)
        verbTense.append(verb.simplePast3rdPersonSingPos)
        verbTense.append(verb.simplePast3rdPersonSingInter)
        verbTense.append(verb.simplePast3rdPersonSingNeg)
        verbTense.append(verb.simplePast1stPersonPlPosAlt)
        verbTense.append(verb.simplePast1stPersonPlInterAlt)
        verbTense.append(verb.simplePast1stPersonPlNegAlt)
        verbTense.append(verb.simplePast1stPersonPlPos)
        verbTense.append(verb.simplePast1stPersonPlInter)
        verbTense.append(verb.simplePast1stPersonPlNeg)
        verbTense.append(verb.simplePast2ndPersonPlPos)
        verbTense.append(verb.simplePast2ndPersonPlInter)
        verbTense.append(verb.simplePast2ndPersonPlNeg)
        verbTense.append(verb.simplePast3rdPersonPlPos)
        verbTense.append(verb.simplePast3rdPersonPlInter)
        verbTense.append(verb.simplePast3rdPersonPlNeg)
        verbTense.append(verb.simplePast3rdPersonPlPosAlt)
        verbTense.append(verb.simplePast3rdPersonPlInterAlt)
        verbTense.append(verb.simplePast3rdPersonPlNegAlt)
        verbTense.append(verb.simplePastImpersonalPos)
        verbTense.append(verb.simplePastImpersonalInter)
        verbTense.append(verb.simplePastImpersonalNeg)
        
        self.performSegue(withIdentifier: "verbDetailToVerbTense", sender: self)
        
        
        
        
        
    }
    
    //    @IBAction func simplePastPressed(_ sender: Any) {
    //
    //        tense = "simplePast"
    //        verbTense.append(verb.simplePast1stPersonSingPos)
    //        verbTense.append(verb.simplePast1stPersonSingInter)
    //        verbTense.append(verb.simplePast1stPersonSingNeg)
    //        verbTense.append(verb.simplePast2ndPersonSingPos)
    //        verbTense.append(verb.simplePast2ndPersonSingInter)
    //        verbTense.append(verb.simplePast2ndPersonSingNeg)
    //        verbTense.append(verb.simplePast3rdPersonSingPos)
    //        verbTense.append(verb.simplePast3rdPersonSingInter)
    //        verbTense.append(verb.simplePast3rdPersonSingNeg)
    //        verbTense.append(verb.simplePast1stPersonPlPosAlt)
    //        verbTense.append(verb.simplePast1stPersonPlInterAlt)
    //        verbTense.append(verb.simplePast1stPersonPlNegAlt)
    //        verbTense.append(verb.simplePast1stPersonPlPos)
    //        verbTense.append(verb.simplePast1stPersonPlInter)
    //        verbTense.append(verb.simplePast1stPersonPlNeg)
    //        verbTense.append(verb.simplePast2ndPersonPlPos)
    //        verbTense.append(verb.simplePast2ndPersonPlInter)
    //        verbTense.append(verb.simplePast2ndPersonPlNeg)
    //        verbTense.append(verb.simplePast3rdPersonPlPos)
    //        verbTense.append(verb.simplePast3rdPersonPlInter)
    //        verbTense.append(verb.simplePast3rdPersonPlNeg)
    //        verbTense.append(verb.simplePast3rdPersonPlPosAlt)
    //        verbTense.append(verb.simplePast3rdPersonPlInterAlt)
    //        verbTense.append(verb.simplePast3rdPersonPlNegAlt)
    //        verbTense.append(verb.simplePastImpersonalPos)
    //        verbTense.append(verb.simplePastImpersonalInter)
    //        verbTense.append(verb.simplePastImpersonalNeg)
    //
    //        self.performSegue(withIdentifier: "verbDetailToVerbTense", sender: self)
    //
    //
    //    }
    
    
    @IBAction func habitualPastPressed(_ sender: Any) {
        
        tense = "habitualPast"
        verbTense.append(verb.habitualPast1stPersonSingPos)
        verbTense.append(verb.habitualPast1stPersonSingInter)
        verbTense.append(verb.habitualPast1stPersonSingNeg)
        verbTense.append(verb.habitualPast2ndPersonSingPos)
        verbTense.append(verb.habitualPast2ndPersonSingInter)
        verbTense.append(verb.habitualPast2ndPersonSingNeg)
        verbTense.append(verb.habitualPast3rdPersonSingPos)
        verbTense.append(verb.habitualPast3rdPersonSingInter)
        verbTense.append(verb.habitualPast3rdPersonSingNeg)
        verbTense.append(verb.habitualPast1stPersonPlPosAlt)
        verbTense.append(verb.habitualPast1stPersonPlInterAlt)
        verbTense.append(verb.habitualPast1stPersonPlNegAlt)
        verbTense.append(verb.habitualPast1stPersonPlPos)
        verbTense.append(verb.habitualPast1stPersonPlInter)
        verbTense.append(verb.habitualPast1stPersonPlNeg)
        verbTense.append(verb.habitualPast2ndPersonPlPos)
        verbTense.append(verb.habitualPast2ndPersonPlInter)
        verbTense.append(verb.habitualPast2ndPersonPlNeg)
        verbTense.append(verb.habitualPast3rdPersonPlPos)
        verbTense.append(verb.habitualPast3rdPersonPlInter)
        verbTense.append(verb.habitualPast3rdPersonPlNeg)
        verbTense.append(verb.habitualPast3rdPersonPlPosAlt)
        verbTense.append(verb.habitualPast3rdPersonPlInterAlt)
        verbTense.append(verb.habitualPast3rdPersonPlNegAlt)
        verbTense.append(verb.habitualPastImpersonalPos)
        verbTense.append(verb.habitualPastImpersonalInter)
        verbTense.append(verb.habitualPastImpersonalNeg)
        
        
        self.performSegue(withIdentifier: "verbDetailToVerbTense", sender: self)
    }
    
    
    
    @IBAction func presentPressed(_ sender: Any) {
        
        tense = "present"
        verbTense.append(verb.present1stPersonSingPos)
        verbTense.append(verb.present1stPersonSingInter)
        verbTense.append(verb.present1stPersonSingNeg)
        verbTense.append(verb.present2ndPersonSingPos)
        verbTense.append(verb.present2ndPersonSingInter)
        verbTense.append(verb.present2ndPersonSingNeg)
        verbTense.append(verb.present3rdPersonSingPos)
        verbTense.append(verb.present3rdPersonSingInter)
        verbTense.append(verb.present3rdPersonSingNeg)
        verbTense.append(verb.present1stPersonPlPosAlt)
        verbTense.append(verb.present1stPersonPlInterAlt)
        verbTense.append(verb.present1stPersonPlNegAlt)
        verbTense.append(verb.present1stPersonPlPos)
        verbTense.append(verb.present1stPersonPlInter)
        verbTense.append(verb.present1stPersonPlNeg)
        verbTense.append(verb.present2ndPersonPlPos)
        verbTense.append(verb.present2ndPersonPlInter)
        verbTense.append(verb.present2ndPersonPlNeg)
        verbTense.append(verb.present3rdPersonPlPos)
        verbTense.append(verb.present3rdPersonPlInter)
        verbTense.append(verb.present3rdPersonPlNeg)
        verbTense.append(verb.presentImpersonalPos)
        verbTense.append(verb.presentImpersonalInter)
        verbTense.append(verb.presentImpersonalNeg)
        
        
        self.performSegue(withIdentifier: "verbDetailToVerbTense", sender: self)
        
    }
    
    
    @IBAction func futurePressed(_ sender: Any) {
        
        tense = "future"
        verbTense.append(verb.future1stPersonSingPos)
        verbTense.append(verb.future1stPersonSingInter)
        verbTense.append(verb.future1stPersonSingNeg)
        verbTense.append(verb.future2ndPersonSingPos)
        verbTense.append(verb.future2ndPersonSingInter)
        verbTense.append(verb.future2ndPersonSingNeg)
        verbTense.append(verb.future3rdPersonSingPos)
        verbTense.append(verb.future3rdPersonSingInter)
        verbTense.append(verb.future3rdPersonSingNeg)
        verbTense.append(verb.future1stPersonPlPosAlt)
        verbTense.append(verb.future1stPersonPlInterAlt)
        verbTense.append(verb.future1stPersonPlNegAlt)
        verbTense.append(verb.future1stPersonPlPos)
        verbTense.append(verb.future1stPersonPlInter)
        verbTense.append(verb.future1stPersonPlNeg)
        verbTense.append(verb.future2ndPersonPlPos)
        verbTense.append(verb.future2ndPersonPlInter)
        verbTense.append(verb.future2ndPersonPlNeg)
        verbTense.append(verb.future3rdPersonPlPos)
        verbTense.append(verb.future3rdPersonPlInter)
        verbTense.append(verb.future3rdPersonPlNeg)
        verbTense.append(verb.futureImpersonalPos)
        verbTense.append(verb.futureImpersonalInter)
        verbTense.append(verb.futureImpersonalNeg)
        
        
        self.performSegue(withIdentifier: "verbDetailToVerbTense", sender: self)
        
    }
    
    
    @IBAction func conditionalPressed(_ sender: Any) {
        
        tense = "conditional"
        verbTense.append(verb.conditional1stPersonSingPos)
        verbTense.append(verb.conditional1stPersonSingInter)
        verbTense.append(verb.conditional1stPersonSingNeg)
        verbTense.append(verb.conditional2ndPersonSingPos)
        verbTense.append(verb.conditional2ndPersonSingInter)
        verbTense.append(verb.conditional2ndPersonSingNeg)
        verbTense.append(verb.conditional3rdPersonSingPos)
        verbTense.append(verb.conditional3rdPersonSingInter)
        verbTense.append(verb.conditional3rdPersonSingNeg)
        verbTense.append(verb.conditional1stPersonPlPosAlt)
        verbTense.append(verb.conditional1stPersonPlInterAlt)
        verbTense.append(verb.conditional1stPersonPlNegAlt)
        verbTense.append(verb.conditional1stPersonPlPos)
        verbTense.append(verb.conditional1stPersonPlInter)
        verbTense.append(verb.conditional1stPersonPlNeg)
        verbTense.append(verb.conditional2ndPersonPlPos)
        verbTense.append(verb.conditional2ndPersonPlInter)
        verbTense.append(verb.conditional2ndPersonPlNeg)
        verbTense.append(verb.conditional3rdPersonPlPos)
        verbTense.append(verb.conditional3rdPersonPlInter)
        verbTense.append(verb.conditional3rdPersonPlNeg)
        verbTense.append(verb.conditional3rdPersonPlPosAlt)
        verbTense.append(verb.conditional3rdPersonPlInterAlt)
        verbTense.append(verb.conditional3rdPersonPlNegAlt)
        verbTense.append(verb.conditionalImpersonalPos)
        verbTense.append(verb.conditionalImpersonalInter)
        verbTense.append(verb.conditionalImpersonalNeg)
        self.performSegue(withIdentifier: "verbDetailToVerbTense", sender: self)
        
    }
    
    
    @IBAction func presentSubjunctivePressed(_ sender: Any) {
        
        tense = "presentSubjunctive"
        verbTense.append(verb.presentSubjunctive1stPersonSingPos)
        verbTense.append(verb.presentSubjunctive1stPersonSingNeg)
        verbTense.append(verb.presentSubjunctive2ndPersonSingPos)
        verbTense.append(verb.presentSubjunctive2ndPersonSingNeg)
        verbTense.append(verb.presentSubjunctive3rdPersonSingPos)
        verbTense.append(verb.presentSubjunctive3rdPersonSingNeg)
        verbTense.append(verb.presentSubjunctive1stPersonPlPosAlt)
        verbTense.append(verb.presentSubjunctive1stPersonPlNegAlt)
        verbTense.append(verb.presentSubjunctive1stPersonPlPos)
        verbTense.append(verb.presentSubjunctive1stPersonPlNeg)
        verbTense.append(verb.presentSubjunctive2ndPersonPlPos)
        verbTense.append(verb.presentSubjunctive2ndPersonPlNeg)
        verbTense.append(verb.presentSubjunctive3rdPersonPlPos)
        verbTense.append(verb.presentSubjunctive3rdPersonPlNeg)
        verbTense.append(verb.presentSubjunctiveImpersonalPos)
        verbTense.append(verb.presentSubjunctiveImpersonalNeg)
        self.performSegue(withIdentifier: "verbDetailToVerbTense", sender: self)
    }
    
    
    @IBAction func imperativePressed(_ sender: Any) {
        tense = "imperative"
        verbTense.append(verb.imperative1stPersonSingPos)
        verbTense.append(verb.imperative1stPersonSingNeg)
        verbTense.append(verb.imperative2ndPersonSingPos)
        verbTense.append(verb.imperative2ndPersonSingNeg)
        verbTense.append(verb.imperative3rdPersonSingPos)
        verbTense.append(verb.imperative3rdPersonSingNeg)
        verbTense.append(verb.imperative1stPersonPlPosAlt)
        verbTense.append(verb.imperative1stPersonPlNegAlt)
        verbTense.append(verb.imperative1stPersonPlPos)
        verbTense.append(verb.imperative1stPersonPlNeg)
        verbTense.append(verb.imperative2ndPersonPlPos)
        verbTense.append(verb.imperative2ndPersonPlNeg)
        verbTense.append(verb.imperative3rdPersonPlPos)
        verbTense.append(verb.imperative3rdPersonPlNeg)
        verbTense.append(verb.imperative3rdPersonPlPosAlt)
        verbTense.append(verb.imperative3rdPersonPlNegAlt)
        verbTense.append(verb.imperativeImpersonalPos)
        verbTense.append(verb.imperativeImpersonalNeg)
        self.performSegue(withIdentifier: "verbDetailToVerbTense", sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "verbDetailToVerbTense"{
            let detailVC = segue.destination as! VerbTenseTableViewController
            //detailVC.detailVerbParts = self.verbParts
            detailVC.verb = self.verb
            detailVC.tense = self.tense
            detailVC.verbTense = self.verbTense
            
        }
        
        
    }
    
    
    
    
    
}




