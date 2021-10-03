import SwiftUI

enum ButtonType {
    case tab
    case long
}

struct DefaultButtonStyle: ButtonStyle {
    var color: Color
    var type: ButtonType
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .font(.system(size: 20))
            .foregroundColor(.white)
            .padding()
            .background(color)
            .cornerRadius(20)
            .scaleEffect(configuration.isPressed ? 1.3 : 1.0)
            .onTapGesture {
                if(self.type == .tab) {
                    let haptic =  UIImpactFeedbackGenerator(style: .light)
                    haptic.impactOccurred()
                }
            }
            .onLongPressGesture {
                if(self.type == .long) {
                    let haptic =  UIImpactFeedbackGenerator(style: .heavy)
                    haptic.impactOccurred()
                }
            }
    }
}
