//
//  SearchViewModel.swift
//  NewsApp
//
//  Created by Randimal Geeganage on 2022-09-29.
//

import SwiftUI

@MainActor
class SearchViewModel : ObservableObject {
    
    @Published var phase: DataFetchPhase<[Article]> = .empty
//    @Published var dateFetchPhase : DataFetchPhase<[Article]> = .empty
    @Published var searchQuery = ""
    
    private let newsAPI = NewsAPI.shared
    
    private var trimmedSearchQuery: String {
        searchQuery.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func searchArticle() async {
        if Task.isCancelled { return }
        
        let searchQuery = trimmedSearchQuery
        phase = .empty
        
        if searchQuery.isEmpty {
            return
        }
        
        do {
            let articles = try await newsAPI.search(for: searchQuery)
            if Task.isCancelled { return }
            if searchQuery != trimmedSearchQuery {
                return
            }
            phase = .success(articles)
        } catch {
            if Task.isCancelled { return }
            if searchQuery != trimmedSearchQuery {
                return
            }
            phase = .failure(error)
        }
    }
}

