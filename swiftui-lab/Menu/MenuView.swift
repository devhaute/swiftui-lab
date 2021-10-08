import SwiftUI

let myPets: [String] = ["멍멍이", "야옹이", "찍찍이"]

struct MenuView: View {
    @State private var shouldShowAlert: Bool = false
    @State private var myText: String = ""
    @State private var selected: Int = 0
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Spacer()
                Text(myPets[selected])
                    .font(.system(size: 60))
                    .fontWeight(.bold)
                Text("우측 상단에 땡땡땡을 눌러주세요!")
                    .fontWeight(.black)
                Spacer()
                Spacer()
            }
            .padding()
            .navigationTitle("하이요")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Menu {
                        Button {
                            print("빡공중")
                            self.shouldShowAlert = true
                            self.myText = "오늘도 빡코딩"
                        } label: {
                            Label("빡공 하는날!", systemImage: "flame")
                        }
                        
                        Button {
                            print("휴식중")
                            self.shouldShowAlert = true
                            self.myText = "오늘은 휴식"
                        } label: {
                            Label("집에서 쉬는날?", systemImage: "house.fill")
                        }
                        
                        Section {
                            Button {
                            } label: {
                                Label("새 파일 만들기", systemImage: "doc")
                            }
                            
                            Button {
                            } label: {
                                Label("새 폴더 만들기", systemImage: "folder")
                            }
                        }
                        
                        Section {
                            Button {
                            } label: {
                                Label("파일 모두 삭제", systemImage: "trash")
                            }
                        }
                        
                        Picker("애완동물 선택", selection: $selected) {
                            ForEach(myPets.indices, id: \.self) { index in
                                Text(myPets[index]).tag(index)
                            }
                        }
                        
                    } label: {
                        Label("더보기", systemImage: "ellipsis")
                            .font(.system(size: 25))
                    }
                    
                }
            }
            .alert(isPresented: $shouldShowAlert) {
                Alert(title: Text("알림"), message: Text("\(self.myText)"), dismissButton: .default(Text("확인")))
            }
        }
    }
}

struct MenuView_preview: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
