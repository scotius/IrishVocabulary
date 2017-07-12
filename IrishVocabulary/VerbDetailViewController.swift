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

        parts.firstPersonSingPos = verb.simplePast1stPersonSingPos
        parts.firstPersonSingInter = verb.simplePast1stPersonSingInter
        parts.firstPersonSingNeg = verb.simplePast1stPersonSingNeg
        parts.secondPersonSingPos = verb.simplePast2ndPersonSingPos
        parts.secondPersonSingInter = verb.simplePast2ndPersonSingInter
        parts.secondPersonSingNeg = verb.simplePast2ndPersonSingNeg
        parts.thirdPersonSingPos = verb.simplePast3rdPersonSingPos
        parts.thirdPersonSingInter = verb.simplePast3rdPersonSingInter
        parts.thirdPersonSingNeg = verb.simplePast3rdPersonSingNeg
        parts.firstPersonPlPosAlt = verb.simplePast1stPersonPlPosAlt
        parts.firstPersonPlInterAlt = verb.simplePast1stPersonPlInterAlt
        parts.firstPersonPlNegAlt = verb.simplePast1stPersonPlNegAlt
        parts.firstPersonPlPos = verb.simplePast1stPersonPlPos
        parts.firstPersonPlInter = verb.simplePast1stPersonPlInter
        parts.firstPersonPlNeg = verb.simplePast1stPersonPlNeg
        parts.secondPersonPlPos = verb.simplePast2ndPersonPlPos
        parts.secondPersonPlInter = verb.simplePast2ndPersonPlInter
        parts.secondPersonPlNeg = verb.simplePast2ndPersonPlNeg
        parts.thirdPersonPlPos = verb.simplePast3rdPersonPlPos
        parts.thirdPersonPlInter = verb.simplePast3rdPersonPlInter
        parts.thirdPersonPlNeg = verb.simplePast3rdPersonPlNeg
        parts.thirdPersonPlPosAlt = verb.simplePast3rdPersonPlPosAlt
        parts.thirdPersonPlInterAlt = verb.simplePast3rdPersonPlInterAlt
        parts.thirdPersonPlNegAlt  = verb.simplePast3rdPersonPlNegAlt
        parts.impersonalPos = verb.simplePastImpersonalPos
        parts.impersonalInter = verb.simplePastImpersonalInter
        parts.impersonalNeg = verb.simplePastImpersonalNeg
        createTenseSections()

        
        self.performSegue(withIdentifier: "verbDetailToVerbTense", sender: self)
        
        
        
        
        
    }
    
    
    
    
    @IBAction func habitualPastPressed(_ sender: Any) {
        
        tense = "habitualPast"
        parts.firstPersonSingPos = verb.habitualPast1stPersonSingPos
        parts.firstPersonSingInter = verb.habitualPast1stPersonSingInter
        parts.firstPersonSingNeg = verb.habitualPast1stPersonSingNeg
        parts.secondPersonSingPos = verb.habitualPast2ndPersonSingPos
        parts.secondPersonSingInter = verb.habitualPast2ndPersonSingInter
        parts.secondPersonSingNeg = verb.habitualPast2ndPersonSingNeg
        parts.thirdPersonSingPos = verb.habitualPast3rdPersonSingPos
        parts.thirdPersonSingInter = verb.habitualPast3rdPersonSingInter
        parts.thirdPersonSingNeg = verb.habitualPast3rdPersonSingNeg
        parts.firstPersonPlPosAlt = verb.habitualPast1stPersonPlPosAlt
        parts.firstPersonPlInterAlt = verb.habitualPast1stPersonPlInterAlt
        parts.firstPersonPlNegAlt = verb.habitualPast1stPersonPlNegAlt
        parts.firstPersonPlPos = verb.habitualPast1stPersonPlPos
        parts.firstPersonPlInter = verb.habitualPast1stPersonPlInter
        parts.firstPersonPlNeg = verb.habitualPast1stPersonPlNeg
        parts.secondPersonPlPos = verb.habitualPast2ndPersonPlPos
        parts.secondPersonPlInter = verb.habitualPast2ndPersonPlInter
        parts.secondPersonPlNeg = verb.habitualPast2ndPersonPlNeg
        parts.thirdPersonPlPos = verb.habitualPast3rdPersonPlPos
        parts.thirdPersonPlInter = verb.habitualPast3rdPersonPlInter
        parts.thirdPersonPlNeg = verb.habitualPast3rdPersonPlNeg
        parts.thirdPersonPlPosAlt = verb.habitualPast3rdPersonPlPosAlt
        parts.thirdPersonPlInterAlt = verb.habitualPast3rdPersonPlInterAlt
        parts.thirdPersonPlNegAlt  = verb.habitualPast3rdPersonPlNegAlt
        parts.impersonalPos = verb.habitualPastImpersonalPos
        parts.impersonalInter = verb.habitualPastImpersonalInter
        parts.impersonalNeg = verb.habitualPastImpersonalNeg
        createTenseSections()
        
        self.performSegue(withIdentifier: "verbDetailToVerbTense", sender: self)
    }
    
    
    
    @IBAction func presentPressed(_ sender: Any) {
        
        tense = "present"
        
        parts.firstPersonSingPos = verb.present1stPersonSingPos
        parts.firstPersonSingInter = verb.present1stPersonSingInter
        parts.firstPersonSingNeg = verb.present1stPersonSingNeg
        parts.secondPersonSingPos = verb.present2ndPersonSingPos
        parts.secondPersonSingInter = verb.present2ndPersonSingInter
        parts.secondPersonSingNeg = verb.present2ndPersonSingNeg
        parts.thirdPersonSingPos = verb.present3rdPersonSingPos
        parts.thirdPersonSingInter = verb.present3rdPersonSingInter
        parts.thirdPersonSingNeg = verb.present3rdPersonSingNeg
        parts.firstPersonPlPosAlt = verb.present1stPersonPlPosAlt
        parts.firstPersonPlInterAlt = verb.present1stPersonPlInterAlt
        parts.firstPersonPlNegAlt = verb.present1stPersonPlNegAlt
        parts.firstPersonPlPos = verb.present1stPersonPlPos
        parts.firstPersonPlInter = verb.present1stPersonPlInter
        parts.firstPersonPlNeg = verb.present1stPersonPlNeg
        parts.secondPersonPlPos = verb.present2ndPersonPlPos
        parts.secondPersonPlInter = verb.present2ndPersonPlInter
        parts.secondPersonPlNeg = verb.present2ndPersonPlNeg
        parts.thirdPersonPlPos = verb.present3rdPersonPlPos
        parts.thirdPersonPlInter = verb.present3rdPersonPlInter
        parts.thirdPersonPlNeg = verb.present3rdPersonPlNeg
        parts.impersonalPos = verb.presentImpersonalPos
        parts.impersonalInter = verb.presentImpersonalInter
        parts.impersonalNeg = verb.presentImpersonalNeg
        createTenseSections()
        
        self.performSegue(withIdentifier: "verbDetailToVerbTense", sender: self)
        
    }
    
    
    @IBAction func futurePressed(_ sender: Any) {
        
        tense = "future"
        
        parts.firstPersonSingPos = verb.future1stPersonSingPos
        parts.firstPersonSingInter = verb.future1stPersonSingInter
        parts.firstPersonSingNeg = verb.future1stPersonSingNeg
        parts.secondPersonSingPos = verb.future2ndPersonSingPos
        parts.secondPersonSingInter = verb.future2ndPersonSingInter
        parts.secondPersonSingNeg = verb.future2ndPersonSingNeg
        parts.thirdPersonSingPos = verb.future3rdPersonSingPos
        parts.thirdPersonSingInter = verb.future3rdPersonSingInter
        parts.thirdPersonSingNeg = verb.future3rdPersonSingNeg
        parts.firstPersonPlPosAlt = verb.future1stPersonPlPosAlt
        parts.firstPersonPlInterAlt = verb.future1stPersonPlInterAlt
        parts.firstPersonPlNegAlt = verb.future1stPersonPlNegAlt
        parts.firstPersonPlPos = verb.future1stPersonPlPos
        parts.firstPersonPlInter = verb.future1stPersonPlInter
        parts.firstPersonPlNeg = verb.future1stPersonPlNeg
        parts.secondPersonPlPos = verb.future2ndPersonPlPos
        parts.secondPersonPlInter = verb.future2ndPersonPlInter
        parts.secondPersonPlNeg = verb.future2ndPersonPlNeg
        parts.thirdPersonPlPos = verb.future3rdPersonPlPos
        parts.thirdPersonPlInter = verb.future3rdPersonPlInter
        parts.thirdPersonPlNeg = verb.future3rdPersonPlNeg
        parts.impersonalPos = verb.futureImpersonalPos
        parts.impersonalInter = verb.futureImpersonalInter
        parts.impersonalNeg = verb.futureImpersonalNeg
        createTenseSections()
        
        self.performSegue(withIdentifier: "verbDetailToVerbTense", sender: self)
        
    }
    
    
    @IBAction func conditionalPressed(_ sender: Any) {
        
        tense = "conditional"

        parts.firstPersonSingPos = verb.conditional1stPersonSingPos
        parts.firstPersonSingInter = verb.conditional1stPersonSingInter
        parts.firstPersonSingNeg = verb.conditional1stPersonSingNeg
        parts.secondPersonSingPos = verb.conditional2ndPersonSingPos
        parts.secondPersonSingInter = verb.conditional2ndPersonSingInter
        parts.secondPersonSingNeg = verb.conditional2ndPersonSingNeg
        parts.thirdPersonSingPos = verb.conditional3rdPersonSingPos
        parts.thirdPersonSingInter = verb.conditional3rdPersonSingInter
        parts.thirdPersonSingNeg = verb.conditional3rdPersonSingNeg
        parts.firstPersonPlPosAlt = verb.conditional1stPersonPlPosAlt
        parts.firstPersonPlInterAlt = verb.conditional1stPersonPlInterAlt
        parts.firstPersonPlNegAlt = verb.conditional1stPersonPlNegAlt
        parts.firstPersonPlPos = verb.conditional1stPersonPlPos
        parts.firstPersonPlInter = verb.conditional1stPersonPlInter
        parts.firstPersonPlNeg = verb.conditional1stPersonPlNeg
        parts.secondPersonPlPos = verb.conditional2ndPersonPlPos
        parts.secondPersonPlInter = verb.conditional2ndPersonPlInter
        parts.secondPersonPlNeg = verb.conditional2ndPersonPlNeg
        parts.thirdPersonPlPos = verb.conditional3rdPersonPlPos
        parts.thirdPersonPlInter = verb.conditional3rdPersonPlInter
        parts.thirdPersonPlNeg = verb.conditional3rdPersonPlNeg
        parts.thirdPersonPlPosAlt = verb.conditional3rdPersonPlPosAlt
        parts.thirdPersonPlInterAlt = verb.conditional3rdPersonPlInterAlt
        parts.thirdPersonPlNegAlt  = verb.conditional3rdPersonPlNegAlt
        parts.impersonalPos = verb.conditionalImpersonalPos
        parts.impersonalInter = verb.conditionalImpersonalInter
        parts.impersonalNeg = verb.conditionalImpersonalNeg
        createTenseSections()
        
        self.performSegue(withIdentifier: "verbDetailToVerbTense", sender: self)
        
    }
    
    
    @IBAction func presentSubjunctivePressed(_ sender: Any) {
        
        tense = "presentSubjunctive"
        
        parts.firstPersonSingPos = verb.presentSubjunctive1stPersonSingPos
        parts.firstPersonSingNeg = verb.presentSubjunctive1stPersonSingNeg
        parts.secondPersonSingPos = verb.presentSubjunctive2ndPersonSingPos
        parts.secondPersonSingNeg = verb.presentSubjunctive2ndPersonSingNeg
        parts.thirdPersonSingPos = verb.presentSubjunctive3rdPersonSingPos
        parts.thirdPersonSingNeg = verb.presentSubjunctive3rdPersonSingNeg
        parts.firstPersonPlPosAlt = verb.presentSubjunctive1stPersonPlPosAlt
        parts.firstPersonPlNegAlt = verb.presentSubjunctive1stPersonPlNegAlt
        parts.firstPersonPlPos = verb.presentSubjunctive1stPersonPlPos
        parts.firstPersonPlNeg = verb.presentSubjunctive1stPersonPlNeg
        parts.secondPersonPlPos = verb.presentSubjunctive2ndPersonPlPos
        parts.secondPersonPlNeg = verb.presentSubjunctive2ndPersonPlNeg
        parts.thirdPersonPlPos = verb.presentSubjunctive3rdPersonPlPos
        parts.thirdPersonPlNeg = verb.presentSubjunctive3rdPersonPlNeg
        parts.impersonalPos = verb.presentSubjunctiveImpersonalPos
        parts.impersonalNeg = verb.presentSubjunctiveImpersonalNeg
        createTenseSections()
        self.performSegue(withIdentifier: "verbDetailToVerbTense", sender: self)
    }
    
    
    @IBAction func imperativePressed(_ sender: Any) {
        tense = "imperative"
  
        parts.firstPersonSingPos = verb.imperative1stPersonSingPos
        parts.firstPersonSingNeg = verb.imperative1stPersonSingNeg
        parts.secondPersonSingPos = verb.imperative2ndPersonSingPos
        parts.secondPersonSingNeg = verb.imperative2ndPersonSingNeg
        parts.thirdPersonSingPos = verb.imperative3rdPersonSingPos
        parts.thirdPersonSingNeg = verb.imperative3rdPersonSingNeg
        parts.firstPersonPlPosAlt = verb.imperative1stPersonPlPosAlt
        parts.firstPersonPlNegAlt = verb.imperative1stPersonPlNegAlt
        parts.firstPersonPlPos = verb.imperative1stPersonPlPos
        parts.firstPersonPlNeg = verb.imperative1stPersonPlNeg
        parts.secondPersonPlPos = verb.imperative2ndPersonPlPos
        parts.secondPersonPlNeg = verb.imperative2ndPersonPlNeg
        parts.thirdPersonPlPos = verb.imperative3rdPersonPlPos
        parts.thirdPersonPlNeg = verb.imperative3rdPersonPlNeg
        parts.thirdPersonPlPosAlt = verb.imperative3rdPersonPlPosAlt
        parts.thirdPersonPlNegAlt = verb.imperative3rdPersonPlNegAlt
        parts.impersonalPos = verb.imperativeImpersonalPos
        parts.impersonalNeg = verb.imperativeImpersonalNeg
        createTenseSections()
        self.performSegue(withIdentifier: "verbDetailToVerbTense", sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "verbDetailToVerbTense"{
            let tenseVC = segue.destination as! VerbTenseTableViewController
            tenseVC.verb = self.verb
            tenseVC.tense = self.tense
            tenseVC.parts = self.parts
            tenseVC.singularItems = self.singularItems
            tenseVC.pluralItems = self.pluralItems
            tenseVC.impersonalItems = self.impersonalItems
            
            

            
            
        }
        
        
    }
    
    func createTenseSections() {
        singularItems.removeAll()
        pluralItems.removeAll()
        impersonalItems.removeAll()
        
                
    }
    
    
    
}




