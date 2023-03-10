//
//  EmojiMemoryTheme.swift
//  Memorize
//
//   Created by Created by Ashni Croospulle on 2/27/23.
//  
//

import Foundation
import SwiftUI

struct EmojiMemoryTheme: Codable, Identifiable {
    var id: String { name }
    let name: String
    let emoji: [String]
    let colorRGB: UIColor.RGB
    let numberOfPairs: Int

    var color: Color {
        Color(colorRGB)
    }

    var json: Data? {
        try? JSONEncoder().encode(self)
    }

    init(name: String, emoji: [String], colorRGB: UIColor.RGB, numberOfPairs: Int) {
        self.name = name
        self.emoji = emoji
        self.colorRGB = colorRGB
        self.numberOfPairs = numberOfPairs
    }

    init?(json: Data?) {
        if let json = json, let newEmojiTheme = try? JSONDecoder().decode(EmojiMemoryTheme.self, from: json) {
            self = newEmojiTheme
        }
        else {
            return nil
        }
    }

    static var themes: [EmojiMemoryTheme] = [
        EmojiMemoryTheme(name: "Animals", emoji: ["πΆ","π―","π±","π­","π¦","π»","πΌ","π·","π¨","π΅","π¦", "π"], colorRGB: UIColor.blue.rgb, numberOfPairs: 8),
        EmojiMemoryTheme(name: "Halloween", emoji: ["π»","π","π§","π·","πΈ", "π¦", "πͺ", "πͺ", "β", "β°οΈ"], colorRGB: UIColor.orange.rgb, numberOfPairs: 6),
        EmojiMemoryTheme(name: "Suites", emoji: ["β οΈ","β£οΈ","β₯οΈ","β¦οΈ"], colorRGB: UIColor.gray.rgb, numberOfPairs: 4),
        EmojiMemoryTheme(name: "Sport", emoji: ["β½οΈ","π","π","βΎοΈ","πΎ","π","π±", "π", "π", "π₯", "π₯", "π"], colorRGB: UIColor.red.rgb, numberOfPairs: 6),
        EmojiMemoryTheme(name: "Food", emoji: ["π","π","π","π","π","π₯","π₯","π","π","π","π","π"], colorRGB: UIColor.blue.rgb, numberOfPairs: 8),
        EmojiMemoryTheme(name: "Vehicles", emoji: ["π","π","π","π","π","π","π","π","π ","π","π","βοΈ","π³","π","π"], colorRGB: UIColor.purple.rgb, numberOfPairs: 5),
        EmojiMemoryTheme(name: "Faces", emoji: ["π","π","π","π","π","π","π€","π€©",
                                                "π€¬","π₯Ά","π€’","π€ ","π·","π€","π±","π",
                                                "π₯΅","π€‘","π©","π₯³"],
                         colorRGB: UIColor.systemPink.rgb, numberOfPairs: 7),
    ]

    static let template = EmojiMemoryTheme(name: "Untitled", emoji: ["π", "ππ»", "π", "β€οΈ"], colorRGB: UIColor.systemGreen.rgb, numberOfPairs: 4)
}
