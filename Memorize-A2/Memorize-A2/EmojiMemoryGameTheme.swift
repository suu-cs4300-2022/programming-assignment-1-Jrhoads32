//
//  EmojiMemoryGameTheme.swift
//  Memorize-A2
//
//  Created by Jake Mac on 3/11/22.
//

import Foundation

struct EmojiMemoryGameTheme {
    
    private(set) var label: String
    private(set) var emojiSet: [String]
    private(set) var numOfPairs: Int
    private(set) var cardColor: String
    
    // Want to make this static so taht the launcher and preview can use this array
    static let themes = [
        EmojiMemoryGameTheme(label: "Vehicles",
                            emojiSet: ["🚗", "🚙", "🚕", "🚓", "🚀", "⛵️", "🚁", "✈️", "🛸", "🛳", "🚚", "🏍", "🚢", "🚒", "🛴", "🛵", "🛺"],
                            numOfPairs: 12,
                            cardColor: "Purple"),
        EmojiMemoryGameTheme(label: "Fruit",
                             emojiSet: ["🍏", "🍎", "🍇", "🥥", "🍒", "🫐", "🍊", "🍓", "🍌", "🍋", "🍑"],
                             numOfPairs: 8,
                             cardColor: "Pink"),
        EmojiMemoryGameTheme(label: "Animals",
                             emojiSet: ["🦁", "🐨", "🐷", "🐭", "🐥", "🐢", "🦂", "🐌", "🦋", "🦉", "🐞", "🐙", "🐸", "🦆", "🦅", "🦀", "🦏", "🦍", "🐳"],
                             numOfPairs: 16,
                             cardColor: "Green"),
         EmojiMemoryGameTheme(label: "Food",
                              emojiSet: ["🍕", "🍗", "🍟", "🍔", "🥟", "🍩", "🌮", "🌯", "🥪", "🍪", "🍚", "🍙", "🍤"],
                              numOfPairs: 10,
                              cardColor: "Orange"),
        EmojiMemoryGameTheme(label: "Sports",
                             emojiSet: ["⚽️", "🏈", "⚾️", "🥏", "🏓", "🎾", "🏀", "🏒", "🏹", "🥊"],
                             numOfPairs: 12,
                             cardColor: "Red"),
         EmojiMemoryGameTheme(label: "Flags",
                              emojiSet: ["🏴‍☠️", "🏳️‍🌈", "🇦🇱", "🏁", "🇨🇳", "🇺🇸", "🏴󠁧󠁢󠁷󠁬󠁳󠁿", "🏴󠁧󠁢󠁳󠁣󠁴󠁿", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🇬🇧", "🇹🇷", "🇹🇴", "🇸🇴", "🇯🇵", "🇬🇬", "🇪🇺", "🇦🇴", "🇩🇿"],
                              numOfPairs: 18,
                              cardColor: "Blue")
    ]
    
    init(label: String, emojiSet: [String], numOfPairs: Int, cardColor: String) {
        self.label = label
        self.emojiSet = emojiSet
        self.cardColor = cardColor
        // If don't have enough emojis for "numOfPairs" reduce it to size of the emojiSet
        if numOfPairs > emojiSet.count {
            self.numOfPairs = emojiSet.count
        } else {
            self.numOfPairs = numOfPairs
        }
    }
    
    
}
