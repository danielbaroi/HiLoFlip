import SwiftUI

struct GameView: View {
    @State private var cards = Array(1...100).shuffled().prefix(7)
    @State private var tokenSide = "HI"
    
    var body: some View {
        VStack {
            TokenView(side: tokenSide)
            Button(action: shuffle) {
                Text("Shuffle")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]) {
                    ForEach(cards, id: \.self) { card in
                        CardView(number: card, isFaceUp: true)
                    }
                }
            }
        }
        .background(Color.green)
    }
    
    func shuffle() {
        cards = Array(1...100).shuffled().prefix(7)
        tokenSide = ["HI", "LO"].randomElement()!
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
