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
                .refreshable {
                    loadTask()
                }
                .onAppear {
                     loadTask()
                }
                .navigationTitle(articleNewsVm.selectedCategory.text)
        }
    }
    
    @ViewBuilder
    private var overlayView : some View{
        
            switch articleNewsVm.phase {
            case .empty :  ProgressView()
            case .success(let articles) where articles.isEmpty: EmptyPlaceHolderView (text: "No article", image: nil)
            case .failure(let error):
                RetryView (text: error.localizedDescription){
                loadTask()
            }
            default : EmptyView()
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
    
    private func loadTask(){
        async {
            await articleNewsVm.loadArticles()
        }
    }
}





struct NewsTabView_Previews: PreviewProvider {
    static var previews: some View {
        NewsTabView(articleNewsVm: NewsViewModel(articles: Article.previewData))
    }
}
