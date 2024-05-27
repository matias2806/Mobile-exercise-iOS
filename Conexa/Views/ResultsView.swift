//
//  ResultsView.swift
//  Conexa
//
//  Created by Matias Palmieri on 26/05/2024.
//

import SwiftUI

struct ResultsView: View {
    var searchResults: [New]
    
    var body: some View {
        List(searchResults) { new in
            NavigationLink(destination: NewDetailView(new: new)) {
                Text(new.title)
            }
        }
    }
}
