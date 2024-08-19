//
//  ToDoListViewModel.swift
//  Toodles
//
//  Created by  Praggya Verma on 19/08/24.
//

import Foundation
import SwiftUI

class ToDoListViewModel: ObservableObject {
    @Published var items: [ToDoItem] = [] {
        didSet {
            saveItems()
        }
    }

    private let itemsKey = "toDoItems"

    init() {
        loadItems()
    }

    func addItem(title: String) {
        let newItem = ToDoItem(title: title, isCompleted: false)
        items.append(newItem)
    }

    func updateItem(item: ToDoItem, title: String) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].title = title
        }
    }

    func toggleCompletion(item: ToDoItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index].isCompleted.toggle()
        }
    }

    func deleteItem(item: ToDoItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items.remove(at: index)
        }
    }

    private func saveItems() {
        if let encoded = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encoded, forKey: itemsKey)
        }
    }

    private func loadItems() {
        if let savedItems = UserDefaults.standard.data(forKey: itemsKey) {
            if let decodedItems = try? JSONDecoder().decode([ToDoItem].self, from: savedItems) {
                items = decodedItems
            }
        }
    }
}
