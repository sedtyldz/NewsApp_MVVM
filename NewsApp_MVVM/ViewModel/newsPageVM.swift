//
//  newsPageVM.swift
//  NewsAppMVVM
//
//  Created by Sedat Yıldız on 3.01.2025.
//

import Foundation



class newsPageVM: ObservableObject {
    
    @Published var newsCategory = "Technology"
    @Published var newsList: [Response] = []
    
    var apiCallObject = APICall()
    
    func getNews() {
        print("Get news working")
        apiCallObject.fetchnews(category:newsCategory){ result in
            
            switch result {
            case.failure(let error):
                print(error)
            
            case.success(let response):
                let filteredArticles = response.articles.filter { article in
                            article.title != "[Removed]" &&
                            article.source.name != "[Removed]" &&
                            article.description != "[Removed]" &&
                            article.urlToImage != "[Removed]"  &&
                            article.url != "[Removed]"         &&
                            article.publishedAt != "[Removed]" &&
                            article.author != "[Removed]"
                    
                    
                        }
                DispatchQueue.main.async {
                    self.newsList = filteredArticles
                }
            }
            
        }
    }
    
}










