//
//  ArticleVM.swift
//  newsMVVM
//
 //

import Foundation

struct ArticleVM {
    private let article : Article
}
extension ArticleVM {
    init(_ article : Article) {
        self.article = article
    }
    var title : String{
        self.article.title
    }
    var description : String{
        self.article.description
    }
}

struct ArticleListVM {
    let articles : [Article]
    var numberofSection: Int {
        return 1
    }
    func numberofROwsinSection( _ section: Int) -> Int{
        return self.articles.count
        
    }
    func articleAtIndex( _ index: Int)-> ArticleVM{
        let article = self.articles[index]
        return ArticleVM(article)
    }
}
