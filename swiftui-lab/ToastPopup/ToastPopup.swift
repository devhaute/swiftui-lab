import SwiftUI
import ExytePopupView

struct ToastPopupView: View {
    @State var shouldShowBottomSolidMessage = false
    @State var shouldShowBottomToastMessage = false
    
    func createBottomSolidMessage() -> some View {
        HStack(spacing: 10) {
            Image(systemName: "book.fill")
                .font(.system(size: 40))
                .foregroundColor(.white)
            
            VStack(alignment: .leading) {
                Text("안내 메세지")
                    .fontWeight(.black)
                    .foregroundColor(.white)
                
                Text("토스트 메세지 입니다!")
                    .lineLimit(2)
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                Divider().opacity(0)
            }
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 10)
        .frame(width: UIScreen.main.bounds.width)
        .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 0 : 15)
        .background(Color.purple)
    }
    
    func createBottomToastMessage() -> some View {
        HStack(alignment: .top, spacing: 10) {
            Image("cat")
                .resizable()
                .frame(width: 60, height: 60)
                .scaledToFill()
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text("내 고양이")
                    .fontWeight(.black)
                    .foregroundColor(.white)
                
                Text("토스트 메세지 입니다!")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                Divider().opacity(0)
            }
        }
        .frame(width: 300)
        .padding(15)
        .background(Color.green)
        .cornerRadius(20)
    }
    
    var body: some View {
        ZStack {
            VStack {
                Button {
                    self.shouldShowBottomSolidMessage = true
                } label: {
                    Text("바텀 솔리드 메세지")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                Button {
                    self.shouldShowBottomToastMessage = true
                } label: {
                    Text("바텀 토스트 메세지")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .popup(isPresented: $shouldShowBottomToastMessage, type: .floater(verticalPadding: 20), position: .bottom, animation: .spring(), autohideIn: 2, closeOnTap: true, closeOnTapOutside: true) {
            self.createBottomToastMessage()
        }
    }
}

struct ToastPopupView_preview: PreviewProvider {
    static var previews: some View {
        ToastPopupView()
    }
}

