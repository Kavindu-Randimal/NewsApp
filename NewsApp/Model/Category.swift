//
//  Category.swift
//  NewsApp
//
//  Created by Randimal Geeganage on 2022-09-28.
//

import Foundation


enum Category: String, CaseIterable {
    case general
    case business
    case technology
    case entertainment
    case sports
    case science
    case health
    
    var text: String {
        if self == .general {
            return "Top Headline"
        }
        return rawValue.capitalized
    }
}

extension Category: Identifiable {
    var id: Self { self }
}
