import SwiftUI

struct DeeplinkView: View {
    @State var selectedTab: TabIdentifier = .todos
    
    var body: some View {
        TabView(selection: $selectedTab) {
            TodosView().tabItem {
                VStack {
                    Image(systemName: "list.bullet")
                    Text("할일 목록")
                }
            }.tag(TabIdentifier.todos)
            ProfileView().tabItem {
                Image(systemName: "person.circle.fill")
                Text("프로필")
            }.tag(TabIdentifier.profile)
        }
        .onOpenURL { url in
            guard let tabId = url.tabIdentifier else {
                return
            }
            
            self.selectedTab = tabId
        }
    }
}

struct DeeplinkView_preview: PreviewProvider {
    static var previews: some View {
        DeeplinkView()
    }
}

enum PageIdentifier: Hashable {
    case todoItem(id: UUID)
}

enum TabIdentifier: Hashable {
    case todos, profile
}

extension URL {
    var isDeaplink: Bool {
        return scheme == "deeplink-swiftui"
    }
    
    var tabIdentifier: TabIdentifier? {
        guard isDeaplink else {
            return nil
        }
        
        switch host {
        case "todos":
            return .todos
        case "profile":
            return .profile
        default:
            return nil
        }
    }
    
    var detailPage: PageIdentifier? {
        guard let tabId = tabIdentifier,
              pathComponents.count > 1,
              let uuid = UUID(uuidString: pathComponents[1])
        else {
            return nil
        }
        
        switch tabId {
        case .todos:
            return .todoItem(id: uuid)
        default:
            return nil
        }
    }
}
