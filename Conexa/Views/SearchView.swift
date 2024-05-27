//
//  SearchView.swift
//  Conexa
//
//  Created by Matias Palmieri on 26/05/2024.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    let news: [New]
    
    var filteredNews: [New] {
        if searchText.isEmpty {
            return news
        } else {
            return news.filter { $0.title.contains(searchText) }
        }
    }
    
    var body: some View {
        VStack {
            TextField("Buscar noticias...", text: $searchText)
                .padding()
            Spacer()
            if filteredNews.isEmpty {
                Text("Ups! Esa noticia no la tenemos")
                    .foregroundColor(.red)
                    .font(.headline)
                    .padding()
            } else {
                ResultsView(searchResults: filteredNews)
            }
        }
    }
}

