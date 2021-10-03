import SwiftUI

struct QRCodeGuideLineView: View {
    var body: some View {
        GeometryReader { proxy in
            RoundedRectangle(cornerRadius: 20)
                .stroke(style: StrokeStyle(lineWidth: 8, dash: [12]))
                .foregroundColor(.orange)
                .frame(width: 250, height: 300, alignment: .center)
                .position(x: proxy.size.width / 2, y: proxy.size.height / 2)
        }
    }
}

struct QRCodeGuideLineView_Preview: PreviewProvider {
    static var previews: some View {
        QRCodeGuideLineView()
    }
}
