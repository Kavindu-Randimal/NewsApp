//
//  NewsView.swift
//  NewsApp
//
//  Created by Randimal Geeganage on 2022-09-28.
//

import SwiftUI

struct NewsListView: View {
    
    let articles : [Article]
    @State private var selectedArticle : Article?
    
    var body: some View {
            List{
                ForEach(articles) { article in
                    NewsViewRow(article: article)
                        .onTapGesture {
                            selectedArticle = article
                        }
                }
            }
            .listStyle(.plain)
            .sheet(item: $selectedArticle) {
                webView(url: $0.articleURL)
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NewsListView(articles: Article.previewData)
        }
    }
}
