//
//  EmojiMemoryGame.swift
//  CS193P
//
//  Created by Kyu jin Lee on 2022/07/23.
//
// ViewModel

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["🚗" , "🚕" , "🚙" , "🚌" , "🚎" , "🚐" , "🚒" ,  "🚑", "🚓", "🏎️", "🛻" , "🚚" , "🚜" , "🚛" , "🛵" , "🚲" , "🛴" , "🚠" , "🚝" , "🚃" , "🚁" , "🚀" , "🛳️" , "🛸" , "✈️"]
    
    static func createCard() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createCard()
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
