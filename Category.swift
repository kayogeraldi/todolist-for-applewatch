import Foundation

struct Category: Identifiable, Codable {
    var id = UUID()
    var name: String
    var tasks: [TaskItem] = []
}
