import SwiftUI

@main
struct HiLoFlip: App {
    var body: some Scene {
        WindowGroup {
            GameView()
        }
    }
}
struct GameView: View {
    @State private var displayedCards: [Int] = Array(1...100).shuffled().prefix(7).sorted()
    @State private var isHi: Bool = true
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    TokenView() // TokenView Hi/Lo
                        .padding(.leading)
                    
                    Spacer()
                    
                    Button("Shuffle") {
                        shuffleGame()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.trailing)
                }
                .padding(8)
                .padding(.vertical, 60)
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 10) {
                    ForEach(displayedCards, id: \.self) { number in
                        CardView(number: number)
                    }
                }
                .padding()
                .padding(.vertical, -50)
            }
        }
        .background(Color(hex: 0x007700))
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            shuffleGame()
        }
    }
    private func shuffleGame() {
        isHi.toggle()
        displayedCards = Array(1...100).shuffled().prefix(7).sorted()
    }
}
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
