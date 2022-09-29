//
//  NewsTabView.swift
//  NewsApp
//
//  Created by Randimal Geeganage on 2022-09-28.
//

import SwiftUI

struct NewsTabView: View {
    @StateObject var articleNewsVm = NewsViewModel()
    
    var body: some View {
        NavigationView{
            NewsListView(articles: articles)
                .overlay(overlayView)
                .task(id: articleNewsVm.fetchTaskToken, loadTask)
                .refreshable(action: refreshTask)
                .navigationTitle(articleNewsVm.fetchTaskToken.category.text)
                .navigationBarItems(trailing: menu)
        }
    }
    
    @ViewBuilder
    private var overlayView : some View{
        
            switch articleNewsVm.phase {
            case .empty :  ProgressView()
            case .success(let articles) where articles.isEmpty: EmptyPlaceHolderView (text: "No articles", image: nil)
            case .failure(let error):
                RetryView(text: error.localizedDescription, retryAction: refreshTask)
            default: EmptyView()
            }
        
    }
    
    private var articles : [Article]{
        if case let .success(articles) = articleNewsVm.phase{
            return articles
        }
        else{
            return []
        }
    }
    
    private func loadTask() async {
        await articleNewsVm.loadArticles()
    }
    
    private func refreshTask() {
        DispatchQueue.main.async {
            articleNewsVm.fetchTaskToken = FetchTaskToken(category: articleNewsVm.fetchTaskToken.category, token: Date())
        }
    }
    
    private var menu: some View {
        Menu {
            Picker("Category", selection: $articleNewsVm.fetchTaskToken.category) {
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





struct NewsTabView_Previews: PreviewProvider {
    static var previews: some View {
        NewsTabView(articleNewsVm: NewsViewModel(articles: Article.previewData))
    }
}
