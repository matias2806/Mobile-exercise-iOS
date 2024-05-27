//
//  UsersViews.swift
//  Conexa
//
//  Created by Matias Palmieri on 27/05/2024.
//

import SwiftUI

struct UsersViews: View {
    
    @State private var users: [User] = []
    let userService = UsersService()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users) { user in
                    NavigationLink(destination: UserDetailView(user: user)) {
                        Text(user.firstname + " " + user.lastname)
                    }
                }
                .navigationTitle("Conexa")
            }
        }
        
        .onAppear {
            userService.getUsers { result in
                switch result {
                case .success(let users):
                    self.users = users
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
    }
}

#Preview {
    UsersViews()
}
