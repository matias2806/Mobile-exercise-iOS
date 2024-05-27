//
//  NewsView.swift
//  Conexa
//
//  Created by Matias Palmieri on 27/05/2024.
//

import SwiftUI

struct NewsView: View {
    
    @State private var news: [New] = []
    let newsService = NewsService()
    
    var body: some View {
        NavigationView {
            SearchView(news: news)
                .navigationBarTitle("Conexa")
        }
        
        .onAppear {
            newsService.getNews { result in
                switch result {
                case .success(let news):
                    self.news = news
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
    }
}
