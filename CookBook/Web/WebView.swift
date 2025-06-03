//
//  WebView.swift
//  mobileSwiftUI
//
//  Created by ITIT on 07/05/25.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}




struct PageView: View {
    var body: some View {
        NavigationView {
            WebView(url: URL (string:
                                "https://www.apple.com")!)
            .navigationTitle("Apple")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    PageView()
}
