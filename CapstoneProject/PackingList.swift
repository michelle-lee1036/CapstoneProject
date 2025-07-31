
import SwiftUI
import SwiftData

struct PackingList: View {
    @State private var showNewItem = false
    @Query(sort: \ItemNeeded.title) var toDos: [ItemNeeded]
    @Environment(\.modelContext) var modelContext
   
    var body: some View {
        NavigationStack {
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
                List {
                    ForEach(toDos) { toDoItem in
                        HStack {
                            if toDoItem.isImportant {
                                Text("‼️" + toDoItem.title)
                                    .fontWeight(.bold)
                            } else {
                                Text(toDoItem.title)
                            }
                            Spacer()
                        }
                    }
                    .onDelete(perform: deleteToDo)
                }
                .listStyle(.plain)
            }
            .sheet(isPresented: $showNewItem) {
                NewItineraryView(
                    showNewTask: $showNewItem
                )
            }
        }
    }
    func deleteToDo(at offsets: IndexSet) {
        for offset in offsets {
            let toDoItem = toDos[offset]
            modelContext.delete(toDoItem)
        }
    }
}

#Preview {
    PackingList()
}
