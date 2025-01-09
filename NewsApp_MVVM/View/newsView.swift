//
//  newsView.swift
//  NewsAppMVVM
//
//  Created by Sedat Yıldız on 5.01.2025.
//

import SwiftUI

struct newsView: View {
    @State var news_title:String
    @State var news_description:String
    @State var news_image:String
    @State var news_url:String
    @State var news_source:String
    @State var news_author:String
    @State var news_publishedAt:String
    
    var body: some View {
        NavigationStack{
            VStack(alignment:.leading){
                NavigationLink(destination:
                                
                                newsDetail(news_title: news_title, news_description: news_description, news_image: news_image, news_url: news_url, news_source: news_source, news_author: news_author, news_publishedAt: news_publishedAt)
                ) {
                    HStack{
                       
                            AsyncImage(url: URL(string: news_image)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 170, height: 130)
                                    .cornerRadius(10)
                                    
                                    
                                
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 150, height: 150)
                                    .border(Color.blue, width: 1)
                            }
                       
                        Spacer()
                        
                        
                        VStack(alignment:.leading,spacing: 10){
                            Text(news_title)
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                                .padding(.top,15)
                                .multilineTextAlignment(.leading)
                            
                            
                            Text("Source:\(news_source)")
                                .fontWeight(.regular)
                                .foregroundStyle(Color.gray)
                            Spacer()
                        }
                        .frame(height: 150)
                    }
                    
                    
                }}
            
            
        }
        .frame(width: UIScreen.main.bounds.width * 0.9,height: 150)
        
    }}

#Preview(traits: .sizeThatFitsLayout){
    newsView(news_title: "Here’s When ‘Path Of Exile 2’ May Come Out Of Early Access - Forbes", news_description: "Based on what we know, here is when Path of Exile 2 may leave Early Access and launch as a completed game.", news_image: "https://imageio.forbes.com/specials-images/imageserve/675ae91bfcc6e0c65678037a/0x0.jpg?format=jpg&height=900&width=1600&fit=bounds", news_url: "https://www.forbes.com/sites/paultassi/2025/01/04/heres-when-path-of-exile-2-may-come-out-of-early-access/", news_source: "Forbes", news_author: "Paul Tassi", news_publishedAt: "2025-01-04T17:03:33Z")
        
        
}
