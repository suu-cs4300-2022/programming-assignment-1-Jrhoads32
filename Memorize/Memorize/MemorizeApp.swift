//
//  MemorizeDemo_Pt2App.swift
//  MemorizeDemo-Pt2
//
//  Created by Jake Mac on 2/6/22.
//

import SwiftUI

@main
struct MemorizeDemo_Pt2App: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
