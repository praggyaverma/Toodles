//
//  EditItemView.swift
//  Toodles
//
//  Created by  Praggya Verma on 19/08/24.
//

import Foundation
import SwiftUI

struct EditItemView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: ToDoListViewModel
    var item: ToDoItem
    @State private var title: String

    init(viewModel: ToDoListViewModel, item: ToDoItem) {
        self.viewModel = viewModel
        self.item = item
        _title = State(initialValue: item.title)
    }

    var body: some View {
        NavigationView {
            Form {
                TextField("Edit Goal", text: $title)
                Button("Save Changes") {
                    viewModel.updateItem(item: item, title: title)
                    presentationMode.wrappedValue.dismiss()
                }
                .disabled(title.isEmpty)
            }
            .navigationTitle("Edit Goal")
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}
