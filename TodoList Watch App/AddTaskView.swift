import SwiftUI

struct AddTaskView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: TaskViewModel
    var category: Category
    @State private var newTaskTitle = ""

    var body: some View {
        NavigationStack {
            Form {
                TextField("Nome da tarefa", text: $newTaskTitle)
            }
            .navigationTitle("Nova Tarefa")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Salvar") {
                        if !newTaskTitle.isEmpty {
                            viewModel.addTask(to: category, title: newTaskTitle)
                            dismiss()
                        }
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
            }
        }
    }
}
