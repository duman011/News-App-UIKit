//
//  NewsViewModel.swift
//  NewsAppClone
//
//  Created by Yaşar Duman on 19.08.2023.
//

import Foundation

struct NewsViewModel {
    let news: Article
    
    var author: String {
        return news.author ?? "Unkunow"
    }
    
    var title: String {
        return news.title ?? ""
    }
    
    var descripton: String {
        return news.description ?? ""
    }
    
    var url: String {
        return news.url ?? ""
    }
    
    var urlToImage: String {
        return news.urlToImage ?? "https://www.kindpng.com/picc/m/583-5836523_banner-freeuse-stock-news-clipart-icon-cute-borders.png"
    }
    
    
}
