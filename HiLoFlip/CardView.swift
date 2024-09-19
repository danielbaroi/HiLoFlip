import SwiftUI

struct CardView: View {
    let number: Int
    let isFaceUp: Bool
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10)
                    .fill(colorForIndex(number))
                    .frame(width: 100, height: 155)
                Text("\(number)")
                    .font(.largeTitle)
                    .foregroundColor(.black)
                    .padding()
                    .background(Circle().fill(Color.black))
                
                if number % 10 == 0 {
                    // Card ending with 0
                    starInCorners()
                } else if number % 10 == 1 {
                    // Card ending with 1
                    circleSlashInCorners()
                } else if number % 10 == 2 {
                    // Card ending with 2
                    docOnDocInCorners()
                }
            } else {
                // Back of the card
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.black)
                    .frame(width: 100, height: 155)
                VStack {
                    Circle().stroke(Color.white, lineWidth: 2)
                        .frame(width: 30, height: 30)
                        .overlay(Text("HI").foregroundColor(.white))
                    Circle().stroke(Color.white, lineWidth: 2)
                        .frame(width: 30, height: 30)
                        .overlay(Text("LO").foregroundColor(.white))
                }
            }
        }
    }
    
    func colorForIndex(_ index: Int) -> Color {
        let hue = Double(index) / 100.0
        return Color(hue: hue, saturation: 0.8, brightness: 1)
    }
    
    // Symbols based on the number's last digit
    func starInCorners() -> some View {
        VStack {
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "star.fill")
                    .foregroundColor(.white)
            }
            Spacer()
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "star.fill")
                    .foregroundColor(.white)
            }
        }
        .padding()
    }
    
    func circleSlashInCorners() -> some View {
        VStack {
            HStack {
                Image(systemName: "circle.slash")
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "circle.slash")
                    .foregroundColor(.white)
            }
            Spacer()
            HStack {
                Image(systemName: "circle.slash")
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "circle.slash")
                    .foregroundColor(.white)
            }
        }
        .padding()
    }
    
    func docOnDocInCorners() -> some View {
        VStack {
            HStack {
                Image(systemName: "doc.on.doc.fill")
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "doc.on.doc.fill")
                    .foregroundColor(.white)
            }
            Spacer()
            HStack {
                Image(systemName: "doc.on.doc.fill")
                    .foregroundColor(.white)
                Spacer()
                Image(systemName: "doc.on.doc.fill")
                    .foregroundColor(.white)
            }
        }
        .padding()
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(number: 10, isFaceUp: true)
    }
}
