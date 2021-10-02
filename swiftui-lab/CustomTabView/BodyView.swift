import SwiftUI

struct BodyView: View {
    var tabIndex: TabIndex
    var backgroundColor: Color {
        switch tabIndex {
        case .home:
            return Color.green
        case .profile:
            return Color.blue
        case .cart:
            return Color.yellow
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Divider().opacity(0)
            
            HStack(spacing: 0) {
                Divider().opacity(0)
                Text(tabIndex.rawValue)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
        }
        .background(backgroundColor)
        .animation(.none)
    }
}

struct BodyView_Previews: PreviewProvider {
    static var previews: some View {
        BodyView(tabIndex: .profile)
    }
}
