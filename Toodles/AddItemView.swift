//
//  AddItemView.swift
//  Toodles
//
//  Created by  Praggya Verma on 19/08/24.
//

import Foundation
import SwiftUI

struct AddItemView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: ToDoListViewModel
    @State private var title: String = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Enter Goal", text: $title)
                Button("Save Goal") {
                    viewModel.addItem(title: title)
                    presentationMode.wrappedValue.dismiss()
                }
                .disabled(title.isEmpty)
            }
            .navigationTitle("New Goal")
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}
