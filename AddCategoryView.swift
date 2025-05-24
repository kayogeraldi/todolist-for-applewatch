import SwiftUI

struct AddCategoryView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: TaskViewModel
    @State private var newCategoryName = ""

    var body: some View {
        NavigationStack {
            Form {
                TextField("Nome da categoria", text: $newCategoryName)
            }
            .navigationTitle("Nova Categoria")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Salvar") {
                        if !newCategoryName.isEmpty {
                            viewModel.addCategory(name: newCategoryName)
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
