import SwiftUI

struct ButtonStyleView: View {
    var body: some View {
        VStack(spacing: 25) {
            Button {
                
            } label: {
                Text("탭")
                    .fontWeight(.bold)
            }
            .buttonStyle(DefaultButtonStyle(color: .orange, type: .tab))
            
            Button {
                
            } label: {
                Text("롱클릭")
                    .fontWeight(.bold)
            }
            .buttonStyle(DefaultButtonStyle(color: .blue, type: .long))
            
            Button {
                
            } label: {
                Text("회전 버튼")
                    .fontWeight(.bold)
            }
            .buttonStyle(RotateButtonStyle(color: .purple))
            
            Button {
                
            } label: {
                Text("축소 버튼")
                    .fontWeight(.bold)
            }
            .buttonStyle(SmallerButtonStyle(color: .green))
            
            Button {
                
            } label: {
                Text("블러 버튼")
                    .fontWeight(.bold)
            }
            .buttonStyle(BlurButtonStyle(color: .black))
        }
    }
}

struct ButtonStyleView_preview: PreviewProvider {
    static var previews: some View {
        ButtonStyleView()
    }
}
