//
//  webservices.swift
//  newsMVVM
//
//

import Foundation
class Webservices {
    func getArticles(url : URL ,  completion:@escaping (([Article])?)->()) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { data, response , error in
            if let err = error {
                print(err)
                completion(nil)
            } else if let data = data {
                let articlesList = try? JSONDecoder().decode(ArticleList.self, from: data)
                if let articlesList = articlesList{
                    completion(articlesList.articles)
                }
            }
        }
        task.resume()
    }
}
