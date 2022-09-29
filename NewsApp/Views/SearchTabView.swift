//
//  SearchTabView.swift
//  NewsApp
//
//  Created by Randimal Geeganage on 2022-09-29.
//

import SwiftUI

struct SearchTabView: View {
    
    @StateObject var searchVM = SearchViewModel()
    
    var body: some View {
        NavigationView{
            NewsListView(articles: articles)
                .overlay(overlayView)
                .navigationTitle("Search")
        }
        .searchable(text: $searchVM.searchQuery)
        .onSubmit(of: .search, search)
    }
    
    private var articles : [Article]{
        if case .success(let articles) = searchVM.phase{
            return articles
        }else{
            return []
        }
    }
    
    @ViewBuilder
    private var overlayView: some View {
        switch searchVM.phase {
        case .empty:
            if !searchVM.searchQuery.isEmpty {
                ProgressView()
            } else {
                EmptyPlaceHolderView(text: "Type your query to search from NewsAPI", image: Image(systemName: "magnifyingglass"))
            }
            
        case .success(let articles) where articles.isEmpty:
            EmptyPlaceHolderView(text: "No search results found", image: Image(systemName: "magnifyingglass"))
            
        case .failure(let error):
            RetryView(text: error.localizedDescription, retryAction: search)
            
        default: EmptyView()
            
        }
    }
    
    private func search(){
        async{
            await searchVM.searchArticle()
        }
    }
}

struct SearchTabView_Previews: PreviewProvider {
    //    @StateObject static var
    static var previews: some View {
        SearchTabView()
    }
}
