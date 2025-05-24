
import SwiftUI

struct TaskListView: View {
    var category: Category
    @ObservedObject var viewModel: TaskViewModel
    @State private var showingAddTask = false

    var body: some View {
        List {
            ForEach(category.tasks) { task in
                HStack {
                    
                    Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                        .onTapGesture {
                            viewModel.toggleCompletion(for: task, in: category)
                        }
                    Text(task.title)
                        .strikethrough(task.isCompleted)
                    
                }
            }
            .onDelete { indexSet in
                viewModel.deleteTask(at: indexSet, in: category)
            }
        }
        .navigationTitle(category.name)
        
        .toolbar {
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showingAddTask = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddTask) {
            AddTaskView(viewModel: viewModel, category: category)
        }
    }
}
