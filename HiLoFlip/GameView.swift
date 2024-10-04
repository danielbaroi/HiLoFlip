import SwiftUI

struct GameView: View {
    var game = HiLoFlipCardGame(playerNames: ["Player 1", "Player 2"])
    
    var body: some View {
        VStack(spacing: 20) { // Adjusted spacing between sections
            // Top player: 4 cards in first row, 3 in second row
            playerHandView(for: game.players[0], isTopPlayer: true)
                .padding(.top, 60) // Increased top padding to move below the notch

            Spacer()

            // Center controls (Token and Shuffle button)
            HStack {
                TokenView(isHi: game.isTokenHi) // Display token
                
                Spacer()
                
                Button("Shuffle") {
                    game.resetGame() // Shuffle and reset game
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding(.horizontal)
            
            Spacer()
            
            // Bottom player: 4 cards in first row, 3 in second row
            playerHandView(for: game.players[1], isTopPlayer: false)
                .padding(.bottom, 30) // Adds bottom padding for Player 2's hand
        }
        .background(Color(hex: 0x007700)) // Set background color
        .edgesIgnoringSafeArea(.all)
    }
    
    // Player hand view with spacing adjustments
    func playerHandView(for player: HiLoGame.Player, isTopPlayer: Bool) -> some View {
        VStack(spacing: 10) {
            Text("\(player.name) - Score: \(player.score)")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.bottom, 5) // Reduced padding between score and cards
            
            // Grid layout for the cards
            let topRowGridItems = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
            let bottomRowGridItems = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
            
            VStack {
                // First row with 4 cards
                LazyVGrid(columns: topRowGridItems, spacing: 8) { // Adjusted spacing between cards
                    ForEach(game.hand(for: player).prefix(4), id: \.value) { card in
                        CardView(card: card) {
                            game.flipCard(card, for: player)
                        }
                        .frame(width: 60, height: 90) // Smaller card size for better fit
                    }
                }
                .padding(.horizontal, 10) // Adds consistent padding to the sides of the cards
                .padding(.vertical, 10)
                
                Spacer().frame(height: 15) // Adjusted vertical spacing between rows
                
                // Second row with 3 cards
                LazyVGrid(columns: bottomRowGridItems, spacing: 8) { // Adjusted spacing between cards
                    ForEach(game.hand(for: player).suffix(3), id: \.value) { card in
                        CardView(card: card) {
                            game.flipCard(card, for: player)
                        }
                        .frame(width: 60, height: 90) // Smaller card size for better fit
                    }
                }
                .padding(.horizontal, 10) // Adds consistent padding to the sides of the cards
                .padding(.vertical, 10)
            }
        }
    }
}

// Extension for Color (this is correct)
extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
