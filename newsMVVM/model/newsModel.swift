//
//  newsModel.swift
//  newsMVVM
//

//

import Foundation
struct ArticleList : Codable{
    let articles : [Article]
     
}
struct Article : Codable{
    let title : String
    let  description : String
}
