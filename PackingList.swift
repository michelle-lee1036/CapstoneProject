import SwiftUI
import SwiftData
struct PackingList: View {
  @State private var showNewItem = false
  @Query var toDos: [ItemNeeded]
  @Environment(\.modelContext) var modelContext
  var body: some View {
    VStack {
      HStack {
        Text("Packing List:")
          .font(.system(size: 40))
          .fontWeight(.black)
        Spacer()
        Button {
          withAnimation {
            showNewItem = true
          }
        } label: {
          Text("+")
            .font(.title)
            .fontWeight(.bold)
        }
      }
      .padding()
      Spacer()
      List {
        ForEach(toDos) { toDoItem in
          if toDoItem.isImportant {
            Text("‼️" + toDoItem.title)
              .fontWeight(.bold)
          } else {
            Text(toDoItem.title)
          }
        }
        .onDelete(perform: deleteToDo)
      }
      .listStyle(.plain)
    }
    if showNewItem {
      NewItineraryView(toDoItem: ItemNeeded(title: "", isImportant: false), showNewTask: $showNewItem)
    }  }
  func deleteToDo(at offsets: IndexSet) {
    for offset in offsets {
      let toDoItem = toDos [offset]
      modelContext.delete(toDoItem)
    }
  }
}
#Preview {
  PackingList()
    .modelContainer(for: ItemNeeded.self, inMemory: true)
}
