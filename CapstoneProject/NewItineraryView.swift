// NewItineraryView.swift
// CapstoneProject
//
// Created by Scholar on 7/28/25.
//
import SwiftUI
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
#Preview {
  NewItineraryView(
    toDoItem: ItemNeeded(title: "", isImportant: false),
    showNewTask: .constant(false)
  )
}

