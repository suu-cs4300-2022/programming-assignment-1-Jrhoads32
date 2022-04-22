//
//  Memorize_A2App.swift
//  Memorize-A2
//
//  Created by Jake Mac on 3/11/22.
//

import SwiftUI

@main
struct Memorize_L4App: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
