//
//  Noun.swift
//  IrishVocabulary
//
//  Created by Scott on 5/9/17.
//  Copyright © 2017 Scott. All rights reserved.
//

import Foundation
import RealmSwift

class Noun : Object {
    
    
    dynamic var nominativeSingular = ""
    dynamic var genitiveSingular = ""
    dynamic var nominativePlural = ""
    dynamic var genitivePlural = ""
    dynamic var gender = ""
    dynamic var declension = ""
    dynamic var english = ""
    
}
