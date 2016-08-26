//: Playground - noun: a place where people can play

import UIKit
import Foundation

//protocol Array {
//}
//
//protocol String {
//}

extension Array {
    mutating func shuffle() {
        for _ in 0..<10 {
            sort{ (_,_) in arc4random() < arc4random() }
        }
    }
}

//extension String {
//    enum Suit {
//        case Spades, Hearts, Clubs, Diamonds
//    }
//    var suit: Suit {
//        switch self {
//            case "Spades":
//                return .Spades
//            case "Hearts":
//                return .Hearts
//            case "Clubs":
//                return .Clubs
//            case "Diamonds":
//                return .Diamonds
////          default: ?????
//        }
//    }
//}

/* HOW TO HECK DO I IMPLIMENT EXTENSIONS IN A CLASS????
 DOCUMENTATION RE: EXTENSIONS & INHERITANCE SEEMS QUITE LACKING
 FEEL LIKE I NEED TO USE A PROTOCOL BUT NOT SURE HOW
 GETTING LOTS OF ERRORS WITH EVERYTHING I TRY 
 EXTENSIONS SEEMS LIKE BASICALLY NOT MIXINS I GUESS
 NOT EVEN SURE HOW I'D WRITE A PROTOCOL TO INCLUDE AN ENUM */

class Card {
    let suit: String
    let value: String

    init(suit: String, value: String) {
        self.suit = suit
        self.value = value
    }
}

class Deck {
    var contents: [Card]

    init(contents: [Card]) {
        self.contents = contents
    }

    func drawACard() -> Card {
        return draw(numberOfCards: 1).first!
    }

    func shuffle() {
        // mutate extension
    }

    func bury(card card: Card) {
        let randomIndex = Int(arc4random_uniform(UInt32(contents.count)))
        contents.insert(card, atIndex: randomIndex)
    }

    func draw(numberOfCards numberOfCards: Int) -> [Card] {
        var drawnCards = [Card]()
        for _ in 0..<numberOfCards {
            let drawnCard = contents.removeAtIndex(0)
            drawnCards.append(drawnCard)
        }
        return drawnCards
    }

    static func standardDeck() -> Deck {
        var arrayOfCards = [Card]()
        let arrayOfValues = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"]
        let arrayOfSuits = ["Spades", "Clubs", "Hearts", "Diamonds"]
        for value in arrayOfValues {
            for suit in arrayOfSuits {
                let newCard = Card(suit: suit, value: value)
                arrayOfCards.append(newCard)
            }

        }
        let newDeck = Deck(contents: arrayOfCards)
        return newDeck
    }

}

let deck = Deck.standardDeck()
deck.contents
deck.draw(numberOfCards: 4)
deck.drawACard()
var myCard = Card(suit: "Hearts", value: "Queen")
deck.contents.count
deck.bury(card: myCard)
deck.contents.count

