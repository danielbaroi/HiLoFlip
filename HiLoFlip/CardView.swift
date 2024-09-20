import SwiftUI
 
struct CardView: View {
    let number: Int
    @State private var isFaceUp = false
    private var backgroundColor: Color {
        let hue = Double(number) / 100.0
        return Color(hue: hue, saturation: 0.8, brightness: 0.9)
    }
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10)
                    .fill(backgroundColor)
                    .overlay(
                        ZStack {
                            Circle()
                                .fill(Color.black)
                                .frame(width: 60, height: 60)
                            Text("\(number)")
                                .font(.system(size: 30, weight: .bold))
                                .foregroundColor(.white)
                            
                            if number % 10 == 0 {
                                cornerSymbol(systemName: "star.fill")
                            } else if number % 10 == 1 {
                                cornerSymbol(systemName: "circle.slash")
                            } else if number % 10 == 2 {
                                cornerSymbol(systemName: "doc.on.doc.fill")
                            }
                        }
                    )
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.black)
                    .overlay(
                        ZStack {
                            Circle()
                                .stroke(Color.white, lineWidth: 2) // Add white outline
                                .background(Circle().fill(Color.black))
                                .frame(width: 50, height: 50)
                                .overlay(
                                    Text("HI")
                                        .font(.system(size: 24, weight: .bold))
                                        .foregroundColor(.white)
                                )
                                .position(x: 30, y: 40)
                            
                            Circle()
                                .stroke(Color.white, lineWidth: 2) // Add white outline
                                .background(Circle().fill(Color.black))
                                .frame(width: 50, height: 50)
                                .overlay(
                                    Text("LO")
                                        .font(.system(size: 24, weight: .bold))
                                        .foregroundColor(.white)
                                )
                                .position(x: 70, y: 115)
                        }
                    )
            }
        }
        .frame(width: 100, height: 155)
        .onTapGesture {
            withAnimation {
                isFaceUp.toggle()
            }
        }
    }
    private func cornerSymbol(systemName: String) -> some View {
        Group {
            Image(systemName: systemName)
                .foregroundColor(.black)
                .background(
                    Circle()
                        .fill(Color.white)
                        .frame(width: 30, height: 30)
                )
                .position(x: 20, y: 20)
            
            Image(systemName: systemName)
                .foregroundColor(.black)
                .background(
                    Circle()
                        .fill(Color.white)
                        .frame(width: 30, height: 30)
                )
                .position(x: 80, y: 135)
        }
    }
}
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VStack(spacing: 20) {
                
                CardView(number: Int.random(in: 1...100))
            }
        }
    }
}
