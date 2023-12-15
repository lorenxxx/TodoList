//
//  NoItemView.swift
//  TodoList
//
//  Created by loren on 2023/12/15.
//

import SwiftUI

struct NoItemView: View {
    
    @State var animate: Bool = false
    
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("There are no items")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Are you a productive person? I think you should click the Add button and add a bunch of items to your todo list! ")
                    .padding(.bottom, 20)
                
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add something 🥳")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.accentColor : secondaryAccentColor)
                        .cornerRadius(15.0)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? Color.accentColor.opacity(0.7) : secondaryAccentColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0.0,
                    y: animate ? 50.0 : 30.0
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)

            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear {
                addAnimation()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else {
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.easeIn(duration: 2.0).repeatForever()) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationView {
        NoItemView()
            .navigationTitle("Title")
    }
}
