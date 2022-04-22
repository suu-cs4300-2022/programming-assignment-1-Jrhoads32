//
//  EmojiMemoryGame.swift
//  MemorizeDemo-Pt2
//
//  Created by Jake Mac on 2/9/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
    static let emojis = ["🚀","🚁","🚜","🚗","🚙","🚒","🚐","🚚","🚢","🛶","🚃","🛸"]
    
    static var vehicleTheme: MemoryTheme = MemoryTheme(name: "vehicles", emojis: ["🚀","🚁","🚜","🚗","🚙","🚒","🚐","🚚","🚢","🛶","🚃","🛸"], numberOfPairs: 8, color: "red")
    
    
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfCardPairs: vehicleTheme.numberOfPairs) { pairIndex in
            vehicleTheme.emojis[pairIndex]
        }
    }
    
    
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
}
