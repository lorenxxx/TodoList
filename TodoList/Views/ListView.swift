//
//  ListView.swift
//  TodoList
//
//  Created by lorenliang on 2023/12/15.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack { 
            if listViewModel.items.isEmpty {
                NoItemView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                    }
                    .onMove(perform: listViewModel.moveItem)
                    .onDelete(perform: listViewModel.deleteItem)
                    
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("Todo List")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: {
                AddView()
            })
        )
    }

}

#Preview {
    NavigationView {
        ListView()
    }
    .environmentObject(ListViewModel())
    //.preferredColorScheme(.dark) no work
}
