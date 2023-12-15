//
//  ListViewModel.swift
//  TodoList
//
//  Created by lorenliang on 2023/12/15.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init() {
        initItems()
    }
    
    func initItems() {
        let newItems = [
            ItemModel(title: "First item", isCompleted: true),
            ItemModel(title: "Second item", isCompleted: false),
            ItemModel(title: "Third item", isCompleted: false)
        ]
        
        self.items.append(contentsOf: newItems)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        self.items.append(newItem)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func toggleIsCompleted(item: ItemModel) {
        let index = items.firstIndex { existingItem in
            return existingItem.id == item.id
        }
        
        if let safeIndex = index {
            items[safeIndex] = item.toggleIsCompleted()
        } else {
            print("\(item.id) not found")
        }
    }
    
    
}
