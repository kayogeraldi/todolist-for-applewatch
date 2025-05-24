import SwiftUI

struct AddTaskView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: TaskViewModel
    @State private var newTaskTitle = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Task title", text: $newTaskTitle)
            }
            .navigationTitle("New Task")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        if !newTaskTitle.isEmpty {
                            viewModel.addTask(title: newTaskTitle)
                            dismiss()
                        }
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}
