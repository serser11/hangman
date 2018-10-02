//
//  HangmanGame.swift
//  Hangman
//
//  Created by Serena Wu on 10/1/18.
//  Copyright © 2018 iOS DeCal. All rights reserved.
//

import Foundation

class HangmanGame {
    var phrases = HangmanPhrases()
    var word: String
    var incorrect_guesses: String
    var life: Int
    var displayString: String
    
    init() {
        word = phrases.getRandomPhrase()
        incorrect_guesses = ""
        life = 0
        displayString = ""
        print(word)
        for i in word {
            if i == " " {
                displayString = displayString + " "
            }
            else {
                displayString = displayString + "-"
            }
        }
    }
    
    func change(title: String) -> [String] {
        if !(word.contains(title)) {
            incorrect_guesses.append(title)
            life += 1
        } else {
            var new_display: String = ""
            for (i, j) in zip(word, displayString) {
                if i == Character(title) {
                    new_display.append(title)
                } else {
                    new_display.append(j)
                }
                displayString = new_display
            }
        }
        return [incorrect_guesses, displayString, String(life)]
    }
    
    func display() -> String {
        return displayString
    }
    
}

