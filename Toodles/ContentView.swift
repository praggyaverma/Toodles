//
//  ContentView.swift
//  Toodles
//
//  Created by  Praggya Verma on 19/08/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ToDoListViewModel()
    @State private var showingAddItemSheet = false
    @State private var itemToEdit: ToDoItem?

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.items) { item in
                    HStack {
                        Text(item.title)
                            .strikethrough(item.isCompleted, color: .black)
                        Spacer()
                        Button(action: {
                            viewModel.toggleCompletion(item: item)
                        }) {
                            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(item.isCompleted ? .green : .gray)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        Button(action: {
                            itemToEdit = item
                        }) {
                            Image(systemName: "pencil")
                                .foregroundColor(.blue)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        Button(action: {
                            viewModel.deleteItem(item: item)
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
            }
            .navigationTitle("Toodles")
            .navigationBarItems(trailing: Button(action: {
                showingAddItemSheet = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingAddItemSheet) {
                AddItemView(viewModel: viewModel)
            }
            .sheet(item: $itemToEdit) { item in
                EditItemView(viewModel: viewModel, item: item)
            }
        }
    }
}
