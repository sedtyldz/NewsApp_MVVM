//
//  ContentView.swift
//  NewsAppMVVM
//
//  Created by Sedat Yıldız on 3.01.2025.
//

import SwiftUI

struct loadingPage: View {
    @State var isActive:Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var body: some View {
        if isActive{
            newsPage()
        }
        else{
            ZStack{
                ContainerRelativeShape()
                    .fill(LinearGradient(colors: [Color.green,Color.blue,Color.white], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .ignoresSafeArea()
                VStack{
                    
                    VStack(spacing: 25){
                        Image("news")
                            .resizable()
                            .frame(width:300,height:300)
                        Text("Breaking News")
                            .font(Font.custom("TextSize", size: 34))
                            .bold()
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)){
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                    
                }
                .padding()
                .onAppear(perform: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.8){
                        withAnimation {
                            self.isActive = true
                            
                            
}}})}}}}

#Preview {
    loadingPage()
}
