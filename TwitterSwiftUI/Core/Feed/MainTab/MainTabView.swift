//
//  MainTabView.swift
//  TwitterSwiftUI
//
//  Created by Vladimir on 26.04.2023.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedIndex = 0
    var body: some View {
        TabView(selection: $selectedIndex) {
            FeedView()
                .tabItem { Image(systemName: "house")}
                .tag(0)
            ExploreView()
                .tabItem { Image(systemName: "magnifyingglass")}
                .tag(1)
            NotificationsView()
                .tabItem { Image(systemName: "bell")}
                .tag(2)
            MessagesView()
                .tabItem { Image(systemName: "envelope")}
                .tag(3)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
