//
//  NetworkManager.swift
//  NewsAppClone
//
//  Created by Yaşar Duman on 19.08.2023.
//

import Foundation

class NetworkManager {
    let imageCache = NSCache<NSString, NSData>()
    
    static let shared = NetworkManager()
    private init() { }
    
    private let baseUrlString = "https://newsapi.org/v2/"
    private let TopHeaedline = "top-headlines?country=us&category=business"
    private let API_KEY = "774527d9f9134f4fbb4032bec7f77007"
    
    func getNews(completion: @escaping ([Article]?) -> Void){
        let urlString = "\(baseUrlString)\(TopHeaedline)&apiKey=\(API_KEY)"
        guard let url = URL(string: urlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil , let data = data else {
                completion(nil)
                return
            }
            
            let newsEnvelope = try? JSONDecoder().decode(NewsEnvelope.self, from: data)
            newsEnvelope == nil ? completion(nil) : completion(newsEnvelope!.articles)
        }.resume()
    }
    
    func getImage(urlString : String, completion: @escaping (Data?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        if let cacheImaged = imageCache.object(forKey: NSString(string: urlString)) {
            completion(cacheImaged as Data)
        } else {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard error == nil , let data = data else {
                    completion(nil)
                    return
                }
                
                self.imageCache.setObject(data as NSData, forKey: NSString(string: urlString))
                completion(data)
                
            }.resume()
        }
    }
}
