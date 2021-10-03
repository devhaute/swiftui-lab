import SwiftUI

struct BlurButtonStyle: ButtonStyle {
    var color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .font(.system(size: 20))
            .foregroundColor(.white)
            .padding()
            .background(color)
            .cornerRadius(20)
            .blur(radius: configuration.isPressed ? 20 : 0)
    }
}


struct BlurButtonStyle_preview: PreviewProvider {
    static var previews: some View {
        Button {
            // 액셔언
        } label: {
            Text("블러 버튼")
        }
        .buttonStyle(BlurButtonStyle(color: .black))

    }
}
