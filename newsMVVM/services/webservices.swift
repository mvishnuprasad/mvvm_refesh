//
//  webservices.swift
//  newsMVVM
//
//

import Foundation
class Webservices {
    func getArticles(url : URL ,  completion:@escaping (([Article])?)->()) {
        URLSession.shared.dataTask(with: url) { data, response , error in
            if let err = error {
            print(err)
                completion(nil)
            } else if let data = data {
                
                let articlesList = try? JSONDecoder().decode(ArticleList.self, from: data)
                if let articlesList = articlesList{
                    completion(articlesList.articles)
                }
                print(articlesList?.articles)
            }
            
        }.resume()
    }
}
