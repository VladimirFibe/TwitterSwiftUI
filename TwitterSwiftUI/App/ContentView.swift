//
//  ContentView.swift
//  TwitterSwiftUI
//
//  Created by Vladimir on 26.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    var body: some View {
        NavigationStack {
            ZStack(alignment: .topLeading) {
                MainTabView()
                    .offset(x: showMenu ? 300 : 0)
                Color.black
                    .opacity(showMenu ? 0.2 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            showMenu = false
                        }
                    }
                SideMenuView()
                    .offset(x: showMenu ? 0 : -300)
                
            }
            .navigationTitle("Twitter")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        withAnimation(.spring()){showMenu.toggle()}}) {
                            Circle()
                                .frame(width: 32, height: 32)
                                .foregroundColor(.black)
                        }
                }
            }
            .onAppear {
                    showMenu = false
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
