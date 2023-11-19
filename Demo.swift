//
//  Demo.swift
//  Demo
//
//  Created by Refat E Ferdous on 16/11/23.
//

import Foundation

class Demo{
    
    
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard : Int?
    func chooseCard(at index : Int)
    {
//        if cards[index].isFaceUp{
//            cards[index].isFaceUp = false
//        }
//        else{
//            cards[index].isFaceUp = true
//        }
        
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }
            else{
                //either no cards or 2 cards are face up
                
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(noOfPairsOfCards : Int){
        for _ in 1...noOfPairsOfCards{
        let card = Card()
        cards += [card, card]
        //cards.appned(card)
       // cards.append(card)
    }
        //TODO : Shuffle the cards
    }
    
}
