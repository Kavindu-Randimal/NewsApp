//
//  BreakingNewsView.swift
//  NewsApp
//
//  Created by Randimal Geeganage on 2022-09-29.
//

import SwiftUI

struct BreakingNewsView: View {
    
    @StateObject var breakingNewsVm = BreakingNewsViewModel()
    
    var body: some View {
        NavigationView{
            NewsListView(articles: articles)
                .overlay(overlayView)
                .task(id: breakingNewsVm.bNewsFetchTaskToken, loadTask)
                .refreshable(action: refreshTask)
                .navigationTitle("Breaking News")
        }
    }
    
    @ViewBuilder
    private var overlayView : some View{
        
            switch breakingNewsVm.phase {
            case .empty :  ProgressView()
            case .success(let articles) where articles.isEmpty: EmptyPlaceHolderView (text: "No articles", image: nil)
            case .failure(let error):
                RetryView(text: error.localizedDescription, retryAction: refreshTask)
            default: EmptyView()
            }
        
    }
    
    private var articles : [Article]{
        if case let .success(articles) = breakingNewsVm.phase{
            return articles
        }
        else{
            return []
        }
    }
    
    private func loadTask() async {
        await breakingNewsVm.loadArticles()
    }
    
    private func refreshTask() {
        DispatchQueue.main.async {
            breakingNewsVm.bNewsFetchTaskToken = BNewsFetchTaskToken(category: breakingNewsVm.bNewsFetchTaskToken.category, token: Date())
        }
    }
    
    private var menu: some View {
        Menu {
            Picker("Category", selection: $breakingNewsVm.bNewsFetchTaskToken.category) {
                ForEach(Category.allCases) {
                    Text($0.text).tag($0)
                }
            }
        } label: {
            Image(systemName: "line.horizontal.3.decrease.circle.fill")
                .imageScale(.large)
                .foregroundColor(Color.red)
        }
    }
    
}


