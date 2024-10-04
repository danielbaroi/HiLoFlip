//
//  HiLoFlipCardGame.swift
//  HiLoFlip
//
//  Created by Daniel Baroi on 10/3/24.
//

import Foundation
import SwiftUI

@Observable class HiLoFlipCardGame {
    private var game: HiLoGame
    
    var players: [HiLoGame.Player] { game.players }
    var isTokenHi: Bool { game.isTokenHi }
    
    init(playerNames: [String]) {
        self.game = HiLoGame(playerNames: playerNames)
    }
    
    // Resets the game
    func resetGame() {
        game.resetGame()
    }
    
    // Fetches the hand of the specified player
    func hand(for player: HiLoGame.Player) -> [HiLoGame.Card] {
        return player.hand
    }
    
    // Flips a card for a player
    func flipCard(_ card: HiLoGame.Card, for player: HiLoGame.Player) {
        if let playerIndex = game.players.firstIndex(where: { $0.name == player.name }),
           let cardIndex = game.players[playerIndex].hand.firstIndex(where: { $0.value == card.value }) {
            game.players[playerIndex].hand[cardIndex].isFaceUp.toggle()
        }
    }
}

