//
//  ContentView.swift
//  NewsApp
//
//  Created by Randimal Geeganage on 2022-09-27.
//

import SwiftUI

struct ContentView: View {
//    init() {
//    UITabBar.appearance().backgroundColor = UIColor.red
//    }
    var body: some View {
        
        TabView {
            NewsTabView()
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }
            BreakingNewsView()
                .tabItem {
                    Label("Breaking News", systemImage: "lasso.and.sparkles")
                }
            SearchTabView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
        .accentColor(Color.red)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
