//
//  Category.swift
//  TodoList
//
//  Created by Kayo Geraldi on 23/05/25.
//


import Foundation

struct Category: Identifiable, Codable {
    var id = UUID()
    var name: String
    var tasks: [TaskItem] = []
}
