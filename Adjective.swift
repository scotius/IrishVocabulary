//
//  Adjective.swift
//  IrishVocabulary
//
//  Created by Scott on 6/1/17.
//  Copyright © 2017 Scott. All rights reserved.
//

import Foundation
import RealmSwift

class Adjective : Object {
    
    
    dynamic var nominativeSingularMasculine = ""
    dynamic var nominativeSingularFeminine = ""
    dynamic var genitiveSingularMasculine = ""
    dynamic var genitiveSingularFeminine = ""
    dynamic var nominativePlural = ""
    dynamic var nominativePluralSlenderConsonants = ""
    dynamic var genitivePluralStrongPlurals = ""
    dynamic var genitivePluralWeakPlurals = ""
    dynamic var comparativePresent = ""
    dynamic var superlativePresent = ""
    dynamic var declension = ""
    dynamic var english = ""
}
