//
//  UserDetailView.swift
//  Conexa
//
//  Created by Matias Palmieri on 27/05/2024.
//

import SwiftUI
import MapKit

struct UserDetailView: View {
    let user: User
    
    var body: some View {
        VStack {
            Text("Detalles del usuario")
                .font(.title)
                .bold()
                .padding(.bottom)
            Text("\(user.firstname) \(user.lastname)").font(.title)
            Text("\(user.email)").foregroundStyle(.gray)
            Text("\(user.phone.rawValue)").foregroundStyle(.gray)
            HStack {
                Text("Lat: \(user.address.geo.lat)")
                Text("Lng: \(user.address.geo.lng)")
            }.foregroundStyle(.blue)
            
            UserMap(latitude: Double(user.address.geo.lat)!, longitude: Double(user.address.geo.lng)!)
                .frame(height: 400)
            
            Spacer()
        }
    }
}

struct UserMap: UIViewRepresentable {
    let latitude: Double
    let longitude: Double
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        
        let userAnnotation = MKPointAnnotation()
        userAnnotation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        userAnnotation.title = "Usuario"
        
        mapView.addAnnotation(userAnnotation)
        
        let userLocation = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(center: userLocation, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        mapView.setRegion(region, animated: true)
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        // No es necesario actualizar la vista en este ejemplo simple.
    }
}

struct UserPreviewData: PreviewProvider {
    static var previews: some View {
        UserDetailView(user: UserPreviewData.exampleUser)
    }
    
    static var exampleUser: User {
        User(id: 1,
             firstname: "John",
             lastname: "Doe",
             email: "johndoe@example.com",
             birthDate: "1990-01-01",
             login: Login(uuid: "uuid123", username: "johndoe", password: .jsonplaceholderOrg, md5: .c1328472C5794A25723600F71C1B4586, sha1: .the35544A31Cc19Bd6520Af116554873167117F4D94, registered: "2023-05-27T12:00:00Z"),
             address: Address(street: "123 Main St", suite: "Apt. 4", city: .anytown, zipcode: .the123456789, geo: Geo(lat: "37.7749", lng: "-122.4194")),
             phone: .the5555551234,
             website: "www.johndoe.com",
             company: Company(name: "Doe Inc.", catchPhrase: "A catchy slogan", bs: "We do stuff"))
    }
}
