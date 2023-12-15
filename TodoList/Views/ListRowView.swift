//
//  ListRowView.swift
//  TodoList
//
//  Created by lorenliang on 2023/12/15.
//

import SwiftUI

struct ListRowView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
                .onTapGesture {
                    withAnimation(.spring) {
                        listViewModel.toggleIsCompleted(item: item)
                    }
                }
            Text(item.title)
            
            Spacer()
        }
        .font(.title3)
        .padding(.vertical, 8)
    }
}

#Preview {
    Group {
        ListRowView(item: ItemModel(title: "Title 1", isCompleted: false))
        ListRowView(item: ItemModel(title: "Title 2", isCompleted: true))
    }
    .environmentObject(ListViewModel())
    //.previewLayout(.sizeThatFits) ?? not work
}
