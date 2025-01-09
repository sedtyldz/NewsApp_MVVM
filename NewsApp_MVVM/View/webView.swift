//
//  webView.swift
//  NewsAppMVVM
//
//  Created by Sedat Yıldız on 6.01.2025.
//

import SwiftUI
import WebKit


struct webView: UIViewRepresentable {
    let urlString: String

    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}
