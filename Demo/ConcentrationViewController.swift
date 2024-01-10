//
//  ViewController.swift
//  Demo
//
//  Created by Refat E Ferdous on 14/11/23.
//

import UIKit

class ConcentrationViewController: UIViewController {
    
    lazy var game = Demo(noOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount = 0 {
        didSet{
            flipCountLabel.text = "Flip : \(flipCount)"
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
   
    //@IBOutlet var cardButtons: Array<UIButton>!
    
    func updateFlipCountLable() {
        let attributes : [NSAttributedString.Key : Any] = [
            .strokeWidth : 5.0,
            .strokeColor : UIColor.black
        ]
        let attributedString = NSAttributedString(
            string : "Flips: \(flipCount)",
            attributes: attributes
        )
        flipCountLabel.attributedText = attributedString
    }
    
    @IBOutlet weak var flipCountLabel: UILabel! {
        didSet { updateFlipCountLable() }
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
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
    func updateViewFromModel(){
        if cardButtons != nil {
            for index in cardButtons.indices {
                let button = cardButtons[index]
                let card = game.cards[index]
                if card.isFaceUp{
                    button.setTitle(emoji(for : card), for: UIControl.State.normal)
                    button.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
                }
                else{
                    button.setTitle("", for: UIControl.State.normal)
                    button.backgroundColor =  card.isMatched ? #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 0) : #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
                }
            }
        }
    }
    
    var theme : String? {
        didSet {
            emojiChoices = theme ?? ""
            emoji = [:]
            updateViewFromModel()
        }
    }
    var emojiChoices = "😄🤒😇🥳😎🤩🤗"
    
    //var emoji = Dictionary<Int, String>()
    var emoji = [Int : String]()
    func emoji(for card : Card) -> String {
//        if emoji[card.identifier] != nil {
//            return emoji[card.identifier]!
//        }else{
//            return "?"
//        }
        
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card.identifier] = String(emojiChoices.remove(at : randomStringIndex))
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

