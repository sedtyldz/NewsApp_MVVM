//
//  newsDetail.swift
//  NewsAppMVVM
//
//  Created by Sedat Yıldız on 5.01.2025.
//


import SwiftUI
import WebKit

struct newsDetail: View {
    @State var news_title:String
    @State var news_description:String
    @State var news_image:String
    @State var news_url:String
    @State var news_source:String
    @State var news_author:String
    @State var news_publishedAt:String
    
    @State var clicked:Bool = false
    
    var body: some View {
        ZStack{
            ContainerRelativeShape().fill(LinearGradient(colors: [Color.green,Color.white], startPoint: .topLeading, endPoint: .bottomTrailing))
                .ignoresSafeArea()
            
            
            
            VStack(alignment: .leading){
                
                AsyncImage(url: URL(string: news_image)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.width * 0.9)
                                .cornerRadius(10)
                        } placeholder: {
                            ProgressView()
                                .frame(width: UIScreen.main.bounds.width * 0.9)
                        }
            
                
                Text(news_title)
                    .bold()
                    .font(.title)
                    .padding(.bottom,10)
                
                HStack{
                    
                    
                    Text("Author:\(news_author)")
                        .font(.footnote)
                        .bold()
                    Spacer()
                    Text("Published At:  \(news_publishedAt)")
                        .font(.footnote)
    
                }
                .padding(.bottom,10)
                
                Text(news_description)
                    .font(.title3)
                    .padding(.bottom,10)
                HStack{
                    Spacer()
                    Text("Source:\(news_source)")
                        .bold()
                        .font(.footnote)
                }
                
                
                
                Button(action:{
                    clicked = true
                    
                }){
                    Text("Click Here to read this article")
                        .padding()
                        .font(.caption2)
                        .foregroundStyle(Color.white)
                        .background(Color.blue.opacity(0.7))
                        .cornerRadius(10)
                }
                
                /*
                HStack{
                    Text("Author:\(news_author)")
                        .bold()
                        .font(.footnote)
                    Spacer()
                    
                    VStack(alignment: .leading){
                        Text("Source:\(news_source)")
                            .bold()
                            .font(.footnote)
                        
                        Text("Published At:  \(news_publishedAt)")
                            .font(.footnote)
                    }
                   
                        
                }
                */
              
                Spacer()
                
            
            }
            .sheet(isPresented: $clicked, content: {
                webView(urlString: news_url)
            })
            .onAppear(perform:{
                news_publishedAt = String(news_publishedAt.prefix(10))
            })
            .padding()
       
        }
       
    }
}

#Preview {
    newsDetail(news_title: "Here’s When ‘Path Of Exile 2’ May Come Out Of Early Access - Forbes", news_description: "Based on what we know, here is when Path of Exile 2 may leave Early Access and launch as a completed game.", news_image: "https://imageio.forbes.com/specials-images/imageserve/675ae91bfcc6e0c65678037a/0x0.jpg?format=jpg&height=900&width=1600&fit=bounds", news_url: "https://www.forbes.com/sites/paultassi/2025/01/04/heres-when-path-of-exile-2-may-come-out-of-early-access/", news_source: "Forbes", news_author: "Paul Tassi", news_publishedAt: "2025-01-04T17:03:33Z")
}


