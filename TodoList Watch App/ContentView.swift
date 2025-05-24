import SwiftUI



func colorFromName(_ name: String) -> Color {
    switch name.lowercased() {
    case "blue": return Color.blue
    case "red": return Color.red
    case "green": return Color.green
    case "orange": return Color.orange
    case "purple": return Color.purple
    case "pink": return Color.pink
    case "gray": return Color.gray
    default: return Color.gray
    }
}


struct ContentView: View {
    @StateObject private var viewModel = TaskViewModel()
    @State private var showingAddCategory = false

    var body: some View {
        NavigationStack {
            List {
                if viewModel.categories.isEmpty {
                    Text("Ainda não há categorias!")
                }
                ForEach(viewModel.categories) { category in
                    NavigationLink(destination: TaskListView(category: category, viewModel: viewModel)) {
                        HStack {
                            Circle()
                                .fill(colorFromName(category.colorName))
                                .frame(width: 10, height: 10)
                            Text(category.name)
                            Spacer()
                            Text("\(category.completedCount)/\(category.tasks.count)")
                        }
                    }
                }
                .onDelete(perform: viewModel.deleteCategory)
            }


            .navigationTitle("Categorias")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        showingAddCategory = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddCategory) {
                AddCategoryView(viewModel: viewModel)
            }
        }
    }
}
