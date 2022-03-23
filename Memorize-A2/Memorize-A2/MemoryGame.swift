//
//  MemoryGame.swift
//  Memorize-A2
//
//  Created by Jake Mac on 3/11/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    private(set) var score: Int
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            let faceUpCardIndices = cards.indices.filter({ cards[$0].isFaceUp })
            
            return faceUpCardIndices.oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        // Now that we have our card pairs, time to shuffle them!
        cards = cards.shuffled()
        score = 0
    }
    
    // ~~~ Possible cases when a card is chosen:
    //      1. Two are chosen and don't match
    //          - If one of the cards have been seen before, -1 point for each card that has been seen
    //          - Else marks them as being seen
    //      2. If cards do match, remove them from the board and +2 points to the score
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id }), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                }
            } else {
                for index in cards.indices {
                    if cards[index].isFaceUp {
                        cards[index].isFaceUp = false
                        if cards[index].beenSeen && !cards[index].isMatched {
                            score -= 1
                        } else {
                            cards[index].beenSeen = true
                        }
                    }
                }
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
        print("\(cards)")
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        var beenSeen = false
        let content: CardContent
        let id: Int
    }
    
}

extension Array {
    var oneAndOnly: Element? {
        if self.count == 1 {
            return self.first
        } else {
            return nil
        }
    }
}
