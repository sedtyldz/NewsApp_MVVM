//
//  APICall.swift
//  NewsAppMVVM
//
//  Created by Sedat Yıldız on 3.01.2025.
//

import Foundation


class APICall {
    
    static let shared = APICall()
    
    let apiKey = "Your Api Key"
    
    
    func fetchnews(category:String,completion:@escaping(Result<NewsModel,apiError>)->Void){
        
        
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=\(category)&apiKey=\(apiKey)") else{
            print("Invalid URL")
            return completion(.failure(.invalidURL))
        }
        
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
           
            
            guard let data = data,error == nil else {
                print("No data")
                return completion(.failure(.invalidResponse))
            }
            
            /*
            if let res = String(data:data,encoding: .utf8){
                print(res)
            }
             */
            print("data alındı")
            guard let newsResponse = try? JSONDecoder().decode(NewsModel.self, from: data) else {
                print("Json Decoding Error")
                return completion(.failure(.parsingError))
            }
            
            print(newsResponse)
            
            completion(.success(newsResponse))
    
        }
        task.resume()
    }}


enum apiError:Error {
    case invalidURL
    case invalidResponse
    case parsingError
}
