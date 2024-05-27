//
//  ContentView.swift
//  Conexa
//
//  Created by Matias Palmieri on 26/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            NewsView()
                .tabItem {
                    Label("Noticias", systemImage: "newspaper")
                }
            UsersViews()
                .tabItem {
                    Label("Usuarios", systemImage: "person.2")
                }
        }
    }
}

#Preview {
    ContentView()
}
