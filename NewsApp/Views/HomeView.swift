//
//  HomeView.swift
//  NewsApp
//
//  Created by Randimal Geeganage on 2022-09-28.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        List {
            HStack{
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            .padding()
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
