import SwiftUI

struct TokenView: View {
    let side: String // Either "HI" or "LO"
    
    var body: some View {
        Circle()
            .fill(Color.black)
            .frame(width: 150, height: 150)
            .overlay(
                Circle().stroke(Color.white, lineWidth: 2)
            )
            .overlay(
                Text(side)
                    .font(.largeTitle)
                    .foregroundColor(.white)
            )
    }
}

struct TokenView_Previews: PreviewProvider {
    static var previews: some View {
        TokenView(side: "HI")
    }
}
