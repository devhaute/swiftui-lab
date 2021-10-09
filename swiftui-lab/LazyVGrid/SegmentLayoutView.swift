import SwiftUI

enum LayoutType: String, CaseIterable {
    case table = "테이블"
    case grid = "그리드"
    case multiple = "멀티플"
}

extension LayoutType {
    var column: [GridItem] {
        switch self {
        case .table:
            return [GridItem(.flexible())]
        case .grid:
            return [GridItem(.flexible()), GridItem(.flexible())]
        case .multiple:
            return [GridItem(.adaptive(minimum: 100))]
        }
    }
}

struct SegmentLayoutView: View {
    @State var selectedLayoutType: LayoutType = .table
    var dummyData = MyModel.dummyDataArray
    
    var body: some View {
        VStack {
            Picker(selection: $selectedLayoutType) {
                ForEach(LayoutType.allCases, id: \.self) { layout in
                    Text(layout.rawValue).tag(layout)
                }
            } label: {
                Text("레이아웃 타입")
            }
            .pickerStyle(.segmented)
            
            ScrollView {
                LazyVGrid(columns: selectedLayoutType.column) {
                    ForEach(dummyData) { data in
                        Rectangle()
                            .foregroundColor(.blue)
                            .frame(height: 100)
                            .overlay(
                                Text(data.title)
                                    .foregroundColor(.white)
                            )
                    }
                }
                .animation(.default)
            }
        }
    }
}

struct SegmentLayoutView_Preview: PreviewProvider {
    static var previews: some View {
        SegmentLayoutView()
    }
}
