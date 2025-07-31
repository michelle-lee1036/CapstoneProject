import SwiftUI
import SwiftData

struct NewItineraryView: View {
    @Environment(\.modelContext) var modelContext
    @Binding var showNewTask: Bool
    @State private var title: String = ""
    @State private var isImportant: Bool = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 1.00, green: 0.91, blue: 0.93) // background color
                    .ignoresSafeArea()

                VStack(spacing: 16) {
                    Text("Items Needed:")
                        .font(.headline)
                    TextField("Enter the item needed...", text: $title, axis: .vertical)
                        .textFieldStyle(.roundedBorder)

                    Toggle("Is it essential?", isOn: $isImportant)

                    Button("Save") {
                        let newItem = ItemNeeded(title: title, isImportant: isImportant)
                        modelContext.insert(newItem)
                        showNewTask = false
                    }
                    .buttonStyle(.borderedProminent)

                    Spacer()
                }
                .padding()
            }
            .navigationTitle("🌺🍍⛱️ New Item")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        showNewTask = false
                    }
                }
            }
        }
    }
}

#Preview {
    NewItineraryView(showNewTask: .constant(true))
        .modelContainer(for: ItemNeeded.self, inMemory: true)
}
