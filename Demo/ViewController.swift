//
//  ViewController.swift
//  Demo
//
//  Created by Refat E Ferdous on 14/11/23.
//

import UIKit

class ViewController: UIViewController {
    
   // lazy var game : Demo = Demo(noOfPairsOfCards: (cardButtons.count + 1) / 2)
    private lazy var game : Demo = Demo(noOfPairsOfCards: noOfPairsOfCards)
    
    var noOfPairsOfCards : Int {
        //if we have only read only property then we dont need to use get, just return the value
      //  get{
            return (cardButtons.count+1)/2
       // }
    }
    private(set) var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flip : \(flipCount)"
        }
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    
   
    //@IBOutlet var cardButtons: Array<UIButton>!
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        //flipCard(withEmoji: "😄", on: sender)
        if let cardNumber = cardButtons.index(of: sender){
           // print("cardNumber = \(String(describing: cardNumber))")
           // flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }else{
            print("chosen card was not in the card buttons")
        }
    }
    private func updateViewFromModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for : card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor =  card.isMatched ? #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 0) : #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            }
        }
    }
    
    private var emojiChoices = ["😄", "🤒", "😇", "🥳", "😎", "🤩", "🤗"]
    
    //var emoji = Dictionary<Int, String>()
    private var emoji = [Int : String]()
    private func emoji(for card : Card) -> String {
//        if emoji[card.identifier] != nil {
//            return emoji[card.identifier]!
//        }else{
//            return "?"
//        }
        
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
           // let x = 5.arc4random
           // let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at : emojiChoices.count.arc4random)
        }
        return emoji[card.identifier] ?? "?"
    }
    
//    func flipCard(withEmoji emoji : String, on button : UIButton){
//        print("flipCard(withEmoji : \(emoji))")
//        if button.currentTitle == emoji{
//            button.setTitle("", for: UIControl.State.normal)
//            button.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
//        }
//       else{
//                button.setTitle(emoji, for: UIControl.State.normal)
//                button.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
//            }
//
//    }
//
    
}

extension Int {
    var arc4random: Int{
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        }
        else if self < 0{
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }
        else{
           return 0
        }
    }
}
