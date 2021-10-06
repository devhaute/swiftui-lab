import SwiftUI

struct DeeplinkView: View {
    @State var selectedTab = 1
    
    var body: some View {
        TabView(selection: $selectedTab) {
            TodosView().tabItem {
                VStack {
                    Image(systemName: "list.bullet")
                    Text("할일 목록")
                }
            }.tag(1)
            ProfileView().tabItem {
                Image(systemName: "person.circle.fill")
                Text("프로필")
            }.tag(2)
        }
    }
}

struct DeeplinkView_preview: PreviewProvider {
    static var previews: some View {
        DeeplinkView()
    }
}
