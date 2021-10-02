import SwiftUI

enum TabIndex: String {
    case home = "홈"
    case cart = "장바구니"
    case profile = "프로필"
}

struct CustomTabView: View {
    @State var tabIndex: TabIndex = .home
    
    func getTabForegroundColor(_ tabIndex: TabIndex) -> Color {
        guard tabIndex == self.tabIndex else {
            return .gray
        }
        
        switch tabIndex {
        case .home:
            return .green
        case .cart:
            return .yellow
        case .profile:
            return .blue
        }
    }
    
    func calcTabCircleOffsetX(_ proxy: GeometryProxy) -> CGFloat {
        switch tabIndex {
        case .home:
            return -proxy.size.width / 3
        case .cart:
            return 0
        case .profile:
            return proxy.size.width / 3
        }
    }
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottom){
                BodyView(tabIndex: tabIndex)
                
                Circle()
                    .foregroundColor(.white)
                    .frame(width: proxy.size.width / 3 / 2 + 15, height: proxy.size.width / 3 / 2 + 15)
                    .offset(x: self.calcTabCircleOffsetX(proxy), y: 5)
                
                HStack(spacing: 0) {
                    Button (action: {
                        withAnimation {
                            self.tabIndex = .home
                        }
                        
                    }) {
                        Image(systemName: "house.fill")
                            .font(.system(size: self.tabIndex == .home ? 25: 20))
                            .foregroundColor(self.getTabForegroundColor(.home))
                            .frame(width: proxy.size.width / 3, height: 50)
                            .offset(y: self.tabIndex == .home ? -15 : 0)
                    }
                    
                    Button (action: {
                        withAnimation {
                            self.tabIndex = .cart
                        }
                    }) {
                        Image(systemName: "cart.fill")
                            .font(.system(size: self.tabIndex == .cart ? 25: 20))
                            .foregroundColor(getTabForegroundColor(.cart))
                            .frame(width: proxy.size.width / 3, height: 50)
                            .offset(y: self.tabIndex == .cart ? -15 : 0)
                    }
                    
                    Button(action: {
                        withAnimation {
                            self.tabIndex = .profile
                        }
                    }) {
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: self.tabIndex == .profile ? 25: 20))
                            .foregroundColor(getTabForegroundColor(.profile))
                            .frame(width: proxy.size.width / 3, height: 50)
                            .offset(y: self.tabIndex == .profile ? -15 : 0)
                    }
                }
                .background(Color.white)
            }
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView(tabIndex: .home)
    }
}
