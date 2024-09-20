import SwiftUI
 
struct TokenView: View {
    @State private var isHi: Bool = true
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.black)
                .frame(width: 150, height: 150)
            
            Circle()
                .stroke(Color.white, lineWidth: 2)
                .frame(width: 140, height: 140)
                .padding(10)
            
            Text(isHi ? "HI" : "LO")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .onTapGesture {
            withAnimation {
                isHi.toggle() 
            }
        }
    }
}
 
struct TokenView_Previews: PreviewProvider {
    static var previews: some View {
        TokenView()
            .previewLayout(.sizeThatFits)
    }
}
 
