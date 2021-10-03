import SwiftUI

struct SmallerButtonStyle: ButtonStyle {
    var color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .font(.system(size: 20))
            .foregroundColor(.white)
            .padding()
            .background(color)
            .cornerRadius(20)
            .scaleEffect(configuration.isPressed ? 0.7 : 1.0)
            .opacity(configuration.isPressed ? 0.7 : 1.0)
    }
}

struct SmallerButtonStyle_preview: PreviewProvider {
    static var previews: some View {
        Button {
            print("버튼 클릭")
        } label: {
            Text("호호")
        }.buttonStyle(SmallerButtonStyle(color: .red))
        
    }
}
