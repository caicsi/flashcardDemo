//
//  Flashcard.swift
//  ProblemSet3
//
//  Created by Blanchard, Cai on 2/20/19.
//  Copyright © 2019 Blanchard, Cai. All rights reserved.
//

import Foundation

class Card {
    var english: String
    var french: String
    
    // card will default to show french on front, english as details.
    var frontLanguage: String = "french"
    
    init(english: String, french: String) {
        self.english = english
        self.french = french
    }
    
    func getEnglish() -> String {
        return english
    }
    
    func getFrench() -> String{
        return french
    }
    
    /* Switches the language displayed in the table.
    *  If parameter is not french or english, it will not be changed.
    */
    func setLanguage(_ front: String) {
        if front == "french" {
            frontLanguage = "french"
        } else if front == "english" {
            frontLanguage = "english"
        }
    }
    
    func getCardFront() -> String {
        if frontLanguage == "french" {
            return self.getFrench()
        } else {
            return self.getEnglish()
        }
    }
    
    func getCardDetail() -> String {
        if frontLanguage == "french" {
            return self.getEnglish()
        } else {
            return self.getFrench()
        }
    }
}

