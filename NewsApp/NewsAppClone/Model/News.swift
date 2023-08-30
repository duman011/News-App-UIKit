//
//  News.swift
//  NewsAppClone
//
//  Created by Yaşar Duman on 19.08.2023.
//

import Foundation

struct Article: Decodable {
      
      let author: String?
      let title: String?
      let description: String?
      let url: String?
      let urlToImage: String?
      
      
}

struct NewsEnvelope: Decodable {
    let status: String
    let totalResults : Int
    let articles:[Article]
}
