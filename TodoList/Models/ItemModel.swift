//
//  ItemModel.swift
//  TodoList
//
//  Created by lorenliang on 2023/12/15.
//

import Foundation


// Immutable Struct
struct ItemModel: Identifiable, Codable {
    
    var id: String
    
    let title: String
    
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func toggleIsCompleted() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
    
}
