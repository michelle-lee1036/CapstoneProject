import SwiftUI
import SwiftData
struct PackingList: View {
  @State private var showNewItem = false
  @Query var toDos: [ItemNeeded]
  @Environment(\.modelContext) var modelContext
  var body: some View {
      VStack {
      HStack {
        Text("🌴 Hello Packing List:")
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
            .foregroundColor(.orange)
            .padding(8)
            .background(Color.white)
            .clipShape(Circle())
            
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
            Spacer()
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

import SwiftData
struct NewItineraryView: View {
  @Bindable var toDoItem: ItemNeeded
  @Environment(\.modelContext) var modelContext
  @Binding var showNewTask: Bool
  var body: some View {
    VStack {
      Text("Items Needed:")
      TextField("Enter the item needed...", text: $toDoItem.title, axis: .vertical)
      Toggle(isOn: $toDoItem.isImportant) {
        Text("Is it essential?")
        Button {
          addToDo()
          showNewTask = false
        } label: {
            Text("Save")
        }
      }
    }
    .padding()
  }
  func addToDo() {
    let toDo = ItemNeeded(title: toDoItem.title, isImportant: toDoItem.isImportant)
    modelContext.insert(toDo)
  }
}

#Preview("PackingList Preview") {
    PackingList()
        .modelContainer(for: ItemNeeded.self, inMemory: true)
}
#Preview("NewItineraryView Preview") {
    NewItineraryView(
            toDoItem: ItemNeeded(title: "", isImportant: false),
            showNewTask: .constant(false)
        )
}
