//
//  Card.swift
//  Demo
//
//  Created by Refat E Ferdous on 16/11/23.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier : Int
    
    private static var identifierFactory = 0
    
    private static func getUniqueIdentifier() -> Int  {
        identifierFactory += 1
        return identifierFactory
    }
    
    init(){
//        var card = Card(isFaceUp : false, isMatched : false, identifier : identifier )
        self.identifier = Card.getUniqueIdentifier()
    }
    
}
