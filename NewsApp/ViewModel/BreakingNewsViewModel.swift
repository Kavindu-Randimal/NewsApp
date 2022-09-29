//
//  BreakingNewsViewModel.swift
//  NewsApp
//
//  Created by Randimal Geeganage on 2022-09-29.
//

import SwiftUI


enum BreakingNewsDataFetch<T> {
    
    case empty
    case success(T)
    case failure(Error)
}

struct BNewsFetchTaskToken: Equatable {
    var category: Category
    var token: Date
}

@MainActor
class BreakingNewsViewModel: ObservableObject {
    
    @Published var phase = BreakingNewsDataFetch<[Article]>.empty
    @Published var bNewsFetchTaskToken: BNewsFetchTaskToken
    private let newsAPI = NewsAPI.shared
    
    init(articles: [Article]? = nil, selectedCategory: Category = .general) {
        if let articles = articles {
            self.phase = .success(articles)
        } else {
            self.phase = .empty
        }
        self.bNewsFetchTaskToken = BNewsFetchTaskToken(category: selectedCategory, token: Date())
    }
    
    func loadArticles() async {
        if Task.isCancelled { return }
        phase = .empty
        do {
            let articles = try await newsAPI.fetchBreakingNews(from: bNewsFetchTaskToken.category)
            if Task.isCancelled { return }
            phase = .success(articles)
        }
        catch{
            if Task.isCancelled { return }
            print(error.localizedDescription)
            phase = .failure(error)
        }
    }
}
