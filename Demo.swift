//
//  Demo.swift
//  Demo
//
//  Created by Refat E Ferdous on 16/11/23.
//

import Foundation

struct Demo{
    

    private(set) var cards = [Card]()
    // var cards : Array<Card>
    //var cards = Array<Card>() -- empty array
    
    private var indexOfOneAndOnlyFaceUpCard : Int?{
        get{
            var foundIndex : Int?
            for index in cards.indices{
                if cards[index].isFaceUp {
                    if foundIndex == nil{
                        foundIndex = index
                    }
                    else{
                        return nil
                    }
                }
            }
            return foundIndex
        }
        
        set(newValue){
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index : Int)
    {
//        if cards[index].isFaceUp{
//            cards[index].isFaceUp = false
//        }
//        else{
//            cards[index].isFaceUp = true
//        }
        
        if !cards[index].isMatched {
            assert(cards.indices.contains(index), "Demo.chooseCard(at : \(index)) : chosen index is not in the card")
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index{
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                //indexOfOneAndOnlyFaceUpCard = nil
            }
            else{
                //either no cards or 2 cards are face up
//
//                for flipDownIndex in cards.indices{
//                    cards[flipDownIndex].isFaceUp = false
//                }
//                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(noOfPairsOfCards : Int){
        assert(noOfPairsOfCards > 0, "demo.init(at : \(noOfPairsOfCards)) : u must have at least one pair of cards")
        for _ in 1...noOfPairsOfCards{
        let card = Card()
        cards += [card, card]
        //cards.appned(card)
       // cards.append(card)
    }
        //TODO : Shuffle the cards
    }
    
//    init (identifier : Int){
//        identifier = i
//    }
    
}
