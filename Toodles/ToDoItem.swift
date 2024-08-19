//
//  ToDoItem.swift
//  Toodles
//
//  Created by  Praggya Verma on 19/08/24.
//

import Foundation

struct ToDoItem: Identifiable, Codable {
    var id = UUID()
    var title: String
    var isCompleted: Bool
}
