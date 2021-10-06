import SwiftUI

func prepareDate() -> [TodoItem] {
    var newList: [TodoItem] = []
    
    for number in 0...13 {
        newList.append(TodoItem(id: UUID(), title: "내 할일 \(number)"))
    }
    
    return newList
}

struct TodosView: View {
    @State var todoItems: [TodoItem] = []
    
    init() {
        _todoItems = State(initialValue: prepareDate())
    }
    
    var body: some View {
        NavigationView {
            List(todoItems) { todoItem in
                NavigationLink(destination: Text(todoItem.title)) {
                    Text(todoItem.title)
                }
            }
            .navigationTitle(Text("할일 목록"))
        }
    }
}

struct TodosView_preview: PreviewProvider {
    static var previews: some View {
        TodosView()
    }
}
