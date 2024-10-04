import SwiftUI

struct CardView: View {
    let card: HiLoGame.Card
    let action: () -> Void
    
    var body: some View {
        ZStack {
            if card.isFaceUp {
                // Card when face-up
                RoundedRectangle(cornerRadius: 10)
                    .fill(backgroundColor)
                    .overlay(
                        ZStack {
                            Circle()
                                .fill(Color.black)
                                .frame(width: 55, height: 55)
                            Text("\(card.value)")
                                .font(.system(size: 26, weight: .bold))
                                .foregroundColor(.white)
                            
                            if card.isTenPointCard {
                                cornerSymbol(systemName: "star.fill")
                            } else if card.isMustPlayTwoCard {
                                cornerSymbol(systemName: "circle.slash")
                            } else if card.isSkipCard {
                                cornerSymbol(systemName: "doc.on.doc.fill")
                            }
                        }
                    )
            } else {
                // Card when facedown (positions swapped for HI and LO)
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.black)
                    .overlay(
                        ZStack {
                            // "LO" at the top
                            Circle()
                                .stroke(Color.white, lineWidth: 2)
                                .background(Circle().fill(Color.black))
                                .frame(width: 40, height: 40) // Adjusted size for "LO"
                                .overlay(
                                    Text("LO")
                                        .font(.system(size: 18, weight: .bold)) // Adjusted font size
                                        .foregroundColor(.white)
                                )
                                .position(x: 45, y: 90) // Adjusted position for "LO"
                            
                            // "HI" at the bottom
                            Circle()
                                .stroke(Color.white, lineWidth: 2)
                                .background(Circle().fill(Color.black))
                                .frame(width: 40, height: 40) // Adjusted size for "HI"
                                .overlay(
                                    Text("HI")
                                        .font(.system(size: 18, weight: .bold)) // Adjusted font size
                                        .foregroundColor(.white)
                                )
                                .position(x: 25, y: 30) // Adjusted position for "HI"
                        }
                    )
            }
        }
        .frame(width: 70, height: 115) // Slightly adjusted card size
        .onTapGesture(perform: action)
    }
    
    private var backgroundColor: Color {
        let hue = Double(card.value) / 100.0
        return Color(hue: hue, saturation: 0.8, brightness: 0.9)
    }
    
    private func cornerSymbol(systemName: String) -> some View {
        Group {
            Image(systemName: systemName)
                .foregroundColor(.black)
                .background(
                    Circle()
                        .fill(Color.white)
                        .frame(width: 20, height: 20)
                )
                .position(x: 20, y: 20)
            
            Image(systemName: systemName)
                .foregroundColor(.black)
                .background(
                    Circle()
                        .fill(Color.white)
                        .frame(width: 20, height: 20)
                )
                .position(x: 50, y: 95)
        }
    }
}
