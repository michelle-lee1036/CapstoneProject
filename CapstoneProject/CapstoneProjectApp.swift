


import SwiftUI
import SwiftData

@main
struct CapstoneProjectApp: App {
    var body: some Scene {
        WindowGroup {
            PackingList()
        }
                .modelContainer(for: ItemNeeded.self)
    }
}


