//
//  TodoListApp.swift
//  TodoList
//
//  Created by loren on 2023/12/15.
//

import SwiftUI

/*
 MVVM Architecture
 
 Model: data point
 View: UI
 ViewModel: manages Model for View
 
 */

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(.stack)
            .environmentObject(listViewModel)
        }
    }
    
}
