//
//  newsModel.swift
//  NewsAppMVVM
//
//  Created by Sedat Yıldız on 3.01.2025.
//

import Foundation

struct Response:Codable,Hashable,Equatable{
    var source:Source
    var author:String?
    var title:String
    var description:String?
    var url:String
    var urlToImage:String?
    var publishedAt:String
}

struct Source:Codable,Equatable,Hashable{
    var id:String?
    var name:String
}

struct NewsModel:Codable{
    var status:String
    var totalResults:Int
    var articles:[Response]
}


