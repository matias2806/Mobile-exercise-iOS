//
//  NewDetailView.swift
//  Conexa
//
//  Created by Matias Palmieri on 26/05/2024.
//

import SwiftUI

struct NewDetailView: View {
    
    let new: New
    @State var imageData: Data?
    @State private var loadingError: Error?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 10) {
                if let imageData = imageData,
                   let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .cornerRadius(10)
                        .padding(.horizontal)
                } else if let error = loadingError {
                    Text("Error: \(error.localizedDescription)")
                        .foregroundColor(.red)
                } else {
                    Text("Cargando imagen...")
                }
                
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(new.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    Text(new.slug)
                        .font(.headline)
                        .foregroundColor(.green)
                        .padding(.horizontal)
                    
                }
                
                Divider()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(new.content)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                }
                
                Spacer()
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(new.publishedAt)
                        .font(.caption)
                        .foregroundColor(.mint)
                        .padding(.horizontal)
                }
                
                Spacer()
            }.onAppear {
                loadImage()
            }
        }
    }
    
    func loadImage() {
        var imageUrlString = new.thumbnail
        if imageUrlString.hasPrefix("http://") {
            imageUrlString = imageUrlString.replacingOccurrences(of: "http://", with: "https://")
        }
        
        guard let imageUrl = URL(string: imageUrlString) else {
            loadingError = NetworkError.invalidURL
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            guard let data = data, error == nil else {
                loadingError = error ?? NetworkError.unknown
                return
            }
            
            DispatchQueue.main.async {
                self.imageData = data
            }
        }.resume()
    }
}
