//
//  newsPage.swift
//  NewsAppMVVM
//
//  Created by Sedat Yıldız on 3.01.2025.
//




import SwiftUI

struct newsPage: View {
    @State private var newKind: String = "Technology"
    @ObservedObject var newsVM: newsPageVM
    
    
    init(){
        newsVM = newsPageVM()
    }
    var body: some View {
        NavigationStack{
            VStack{
                Picker("",selection: $newKind){
                    Text("Tech").tag("Technology")
                    Text("Sport").tag("Sports")
                    Text("Science").tag("Science")
                    Text("Business").tag("Business")
                    Text("Health").tag("Health")
                    
                }
                .pickerStyle(SegmentedPickerStyle())
                .onChange(of: newKind){
                    newsVM.newsCategory = newKind
                    newsVM.getNews()
                }
                ScrollView{
                    Spacer().frame(height:10)
                    ForEach(newsVM.newsList,id:\.self){ new in
                        
                        newsView(news_title: new.title, news_description: new.description ?? "", news_image: new.urlToImage ?? "", news_url: new.url, news_source: new.source.name, news_author: new.author ?? "", news_publishedAt: new.publishedAt)
                        
                    }
                    
                    
                    
                    
                }
            }
            .background(LinearGradient(colors: [Color.green,Color.white], startPoint: .topLeading, endPoint: .bottomTrailing))
            .onAppear(perform: {
                newsVM.newsCategory = newKind
                newsVM.getNews()
            })
        }}
}
        


#Preview {
    newsPage()
}

