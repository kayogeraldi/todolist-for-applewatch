
import SwiftUI



struct AddCategoryView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: TaskViewModel
    @State private var newCategoryName = ""
    @State private var selectedColor = "blue" // cor padrão
    
    
    func colorFromName(_ name: String) -> Color {
        switch name.lowercased() {
        case "blue": return Color.blue
        case "red": return Color.red
        case "green": return Color.green
        case "orange": return Color.orange
        case "purple": return Color.purple
        case "pink": return Color.pink
        default: return Color.gray
        }
    }


    let availableColors = ["blue", "red", "green", "orange", "purple", "pink"]

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Nome")) {
                    TextField("Nome da categoria", text: $newCategoryName)
                }
                
                Section(header: Text("Selecione uma cor")) {
                    Picker("Cor", selection: $selectedColor) {
                        ForEach(availableColors, id: \.self) { color in
                            HStack {
                                Circle()
                                    .fill(colorFromName(color))
                                    .frame(width: 20, height: 20)
                                Text(color.capitalized)
                            }
                        }
                    }
                }

            }
            .navigationTitle("Nova Categoria")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Salvar") {
                        if !newCategoryName.isEmpty {
                            viewModel.addCategory(name: newCategoryName, colorName: selectedColor)
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

