//
//  EmojiMemoryGame.swift
//  Memorize-A2
//
//  Created by Jake Mac on 3/11/22.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    @Published private var model: MemoryGame<String>
    private var theme: EmojiMemoryGameTheme
    
    // Need an initi to assign a theme for our EmojiGame before creating it
    // If the theme isn't sent, we'll asign it a value of "nil"
    init (theme: EmojiMemoryGameTheme? = nil) {
        // If theme is "nil" then we'll assign it a random theme
        self.theme = theme ?? EmojiMemoryGameTheme.themes.shuffled()[0]
        model = EmojiMemoryGame.createMemoryGame(theme: self.theme)
    }
    
    private static func createMemoryGame(theme: EmojiMemoryGameTheme) -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: theme.numOfPairs, createCardContent: { (pairIndex: Int) -> String in
            return theme.emojiSet[pairIndex] })
    }
    
    var cards: Array<Card> {
        return model.cards
    }
    
    var score: Int {
        return model.score
    }
    
    // Interpret our themes color, if the case doesn't exist then we default to "Red"
    var cardColor: Color {
        switch theme.cardColor.lowercased() {
        case "red":
            return Color.red
        case "blue":
            return Color.blue
        case "green":
            return Color.green
        case "orange":
            return Color.orange
        case "purple":
            return Color.purple
        case "pink":
            return Color.pink
        default:
            return Color.red
        }
    }
    
    var themeName: String {
        return theme.label
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func newGame() {
        self.theme = EmojiMemoryGameTheme.themes.shuffled()[0]
        model = EmojiMemoryGame.createMemoryGame(theme: self.theme)
    }
}
