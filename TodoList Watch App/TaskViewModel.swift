import Foundation
import Combine

class TaskViewModel: ObservableObject {
    @Published var categories: [Category] = []
    
    func addCategory(name: String, colorName: String) {
        let newCategory = Category(name: name, colorName: colorName)
        categories.append(newCategory)
    }

    
    func addTask(to category: Category, title: String) {
        guard let index = categories.firstIndex(where: { $0.id == category.id }) else { return }
        categories[index].tasks.append(TaskItem(title: title))
    }
    
    func toggleCompletion(for task: TaskItem, in category: Category) {
        guard let catIndex = categories.firstIndex(where: { $0.id == category.id }),
              let taskIndex = categories[catIndex].tasks.firstIndex(where: { $0.id == task.id }) else { return }
        categories[catIndex].tasks[taskIndex].isCompleted.toggle()
    }

    func deleteTask(at offsets: IndexSet, in category: Category) {
        guard let index = categories.firstIndex(where: { $0.id == category.id }) else { return }
        categories[index].tasks.remove(atOffsets: offsets)
    }
    
    func deleteCategory(at offsets: IndexSet) {
        categories.remove(atOffsets: offsets)
    }
}
