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
    @Published var dateFetchPhase : DataFetchPhase<[Article]> = .empty
    @Published var searchQuery = ""
    private let newsApi = NewsAPI.shared
    
    func searchArticle() async {
        let searchQuery = self.searchQuery.trimmingCharacters(in: .whitespacesAndNewlines)
        phase = .empty
        
        if searchQuery.isEmpty {
            return
        }
        do {
            let articles = try await newsApi.search(for: searchQuery)
            phase = .success(articles)
        }catch {
            phase = .failure(error)
        }
    }
}

