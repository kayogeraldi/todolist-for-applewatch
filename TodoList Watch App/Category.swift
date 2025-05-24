

import Foundation

struct Category: Identifiable, Codable {
    var id = UUID()
    var name: String
    var colorName: String 
    var tasks: [TaskItem] = []
    
    var completedCount: Int {
            tasks.filter { $0.isCompleted }.count
        }
}
