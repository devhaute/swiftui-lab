import SwiftUI
import ExytePopupView

struct ToastPopupView: View {
    @State var shouldShowBottomSolidMessage = false
    @State var shouldShowBottomToastMessage = false
    @State var shouldShowTopSolidMessage = false
    @State var shouldShowTopToastMessage = false
    @State var shouldShowPopup = false
    
    private let considerSafeArea: Bool = UIApplication.shared.windows.first?.safeAreaInsets.bottom != 0
    
    func createBottomSolidMessage() -> some View {
        HStack(spacing: 10) {
            Image(systemName: "book.fill")
                .font(.system(size: 40))
                .foregroundColor(.white)
            
            VStack(alignment: .leading, spacing: 0) {
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
        .padding(15)
        .padding(.bottom, self.considerSafeArea ? 15 : 0)
        .background(Color.blue)
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
    
    func createTopSolidMessage() -> some View {
        HStack {
            Image("haute")
                .resizable()
                .frame(width: 60, height: 60)
                .scaledToFill()
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                Text("개발하는 데브오뜨 메시지")
                    .fontWeight(.black)
                    .foregroundColor(.white)
                
                Text("반갑습니다\n오오\n신기하지 않군요")
                    .lineLimit(2)
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                Divider().opacity(0)
            }
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 10)
        .padding(.top, self.considerSafeArea ? 35 : 0)
        .frame(width: UIScreen.main.bounds.width)
        .background(Color.purple)
    }
    
    func createTopToastMessage() -> some View {
        HStack(alignment: .center, spacing: 8) {
            Image(systemName: "paperplane.fill")
                .font(.system(size: 25))
                .foregroundColor(.white)
                .padding(.horizontal, 5)
            
            VStack(alignment: .leading, spacing: 5) {
                Text("이오뜨님의 메세지")
                    .fontWeight(.black)
                    .foregroundColor(.white)
                Text("오늘도 화이팅")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .lineLimit(1)
            }
            .padding(.trailing, 15)
        }
        .padding(10)
        .background(Color.orange)
        .cornerRadius(25)
        .padding(.top, self.considerSafeArea ? 35 : 0)
    }
    
    func createPopup() -> some View {
        VStack {
            Image("haute")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("개발하는 이찬호")
                .foregroundColor(.white)
                .fontWeight(.bold)
            
            Text("한국에서 ios 개발자로 살아남기! 원래 프론트엔드 개발자였다가 ios 개발자로 전직 준비")
                .font(.system(size: 12))
                .foregroundColor(Color(red: 0.9, green: 0.9, blue: 0.9))
                .multilineTextAlignment(.center)
            
            Spacer().frame(height: 10)
            
            Button {
                self.shouldShowPopup = false
            } label: {
                Text("닫기")
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                    .fontWeight(.bold)
            }
            .frame(width: 100, height: 40)
            .background(Color.white)
            .cornerRadius(20.0)
        }
        .padding(.horizontal, 10)
        .frame(width: 300, height: 400)
        .background(Color(hexCode: "B381EB"))
        .cornerRadius(10)
        .shadow(radius: 10)
        .zIndex(2)
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
                        .frame(width: 200)
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
                        .frame(width: 200)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
                
                Button {
                    self.shouldShowTopSolidMessage = true
                } label: {
                    Text("탑 솔리드 메세지")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 200)
                        .padding()
                        .background(Color.purple)
                        .cornerRadius(10)
                }
                
                Button {
                    self.shouldShowTopToastMessage = true
                } label: {
                    Text("탑 토스트 메세지")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 200)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                }
                
                Button {
                    self.shouldShowPopup = true
                } label: {
                    Text("팝업")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 200)
                        .padding()
                        .background(Color(hexCode: "34691F"))
                        .cornerRadius(10)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .popup(isPresented: $shouldShowBottomSolidMessage, type: .toast, position: .bottom, animation: .easeInOut, autohideIn: 2, closeOnTap: true, closeOnTapOutside: true) {
            self.createBottomSolidMessage()
        }
        .popup(isPresented: $shouldShowBottomToastMessage, type: .toast, position: .bottom, animation: .spring(), autohideIn: 2, closeOnTap: true, closeOnTapOutside: true) {
            self.createBottomToastMessage()
        }
        .popup(isPresented: $shouldShowTopSolidMessage, type: .toast, position: .top, animation: .easeInOut, autohideIn: 2, closeOnTap: true, closeOnTapOutside: true) {
            self.createTopSolidMessage()
        }
        
        .popup(isPresented: $shouldShowTopToastMessage, type: .floater(verticalPadding: 20), position: .top, animation: .spring(), autohideIn: 2, closeOnTap: true, closeOnTapOutside: true) {
            self.createTopToastMessage()
        }
        .popup(isPresented: $shouldShowPopup, type: .default, position: .bottom, animation: .spring(), autohideIn: .infinity, closeOnTap: false, closeOnTapOutside: true) {
            self.createPopup()
        }
    }
}

struct ToastPopupView_preview: PreviewProvider {
    static var previews: some View {
        ToastPopupView()
    }
}

