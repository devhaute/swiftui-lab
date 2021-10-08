import SwiftUI

struct MyModel: Identifiable {
    let id: UUID
    let title: String
    let content: String
}

extension MyModel {
    static var dummyDataArray: [MyModel] {
        (1...300).map({(index: Int) in
            return MyModel(id: UUID(), title: "\(index)번 타이틀", content: "\(index)번 내용")
        })
    }
}

struct LazyVGridView: View {
    @State private var dummyData: [MyModel] = MyModel.dummyDataArray
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: 100))
            ], spacing: 1) {
                ForEach(self.dummyData) { (data: MyModel) in
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(height: 30)
                        .overlay(
                            Text(data.title)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        )
                        .cornerRadius(5)
                }
            }
        }
    }
}

struct LazyVGridView_Preview: PreviewProvider {
    static var previews: some View {
        LazyVGridView()
    }
}
