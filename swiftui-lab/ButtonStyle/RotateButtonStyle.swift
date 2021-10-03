import SwiftUI

struct RotateButtonStyle: ButtonStyle {
    var color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .font(.system(size: 20))
            .foregroundColor(.white)
            .padding()
            .background(color)
            .cornerRadius(20)
            .rotationEffect(configuration.isPressed ? .degrees(90) : .degrees(0))
    }
}
