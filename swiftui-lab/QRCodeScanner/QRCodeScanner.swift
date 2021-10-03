import SwiftUI

struct QRCodeScanner: View {
    @State var isPresentingScanner = false
    @State var scannedCode: String?
    
    var body: some View {
        ZStack {
            if self.scannedCode != nil {
                MyWebview(urlToLoad: self.scannedCode!)
            } else {
                MyWebview(urlToLoad: "https://www.naver.com")
            }
            
            VStack {
                Spacer()
                
                Button {
                    self.isPresentingScanner = true
                } label: {
                    Text("로또 번호 확인")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(12)
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(lineWidth: 5)
                        )
                }
                .sheet(isPresented: $isPresentingScanner) {
                    self.scannerSheet
                }
                Spacer()
                    .frame(height: 30)
            }
        }
    }
    
    var scannerSheet : some View {
        ZStack {
            QRCodeGuideLineView()
            CodeScannerView(
                codeTypes: [.qr],
                completion: { result in
                    if case let .success(code) = result {
                        self.scannedCode = code
                        self.isPresentingScanner = false
                    }
                }
            )
        }
    }
}

struct QRCodeScanner_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeScanner()
    }
}
