//
//  APIResponse.swift
//  NewsApp
//
//  Created by Randimal Geeganage on 2022-09-28.
//

import Foundation

struct NewsAPIResponse : Decodable {
    let status : String
    let totalResults : Int?
    let articles : [Article]?
    
    let code : String?
    let message : String?
}
