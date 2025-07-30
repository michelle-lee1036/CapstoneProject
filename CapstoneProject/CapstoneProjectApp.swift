import SwiftUI
import SwiftData
@main
struct CapstoneProjectApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
        .modelContainer(for: ItemNeeded.self)
    }
  }
}
