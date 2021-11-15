//
//  MapView.swift
//  Africa
//
//  Created by Patrick Spafford on 10/23/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: Properties
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(
            latitude: 6.600286,
            longitude: 17.437599
        )
        var mapZoomLevel = MKCoordinateSpan(
            latitudeDelta: 70.0,
            longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(
            center: mapCoordinates,
            span: mapZoomLevel
        )
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    // MARK: Body
    var body: some View {
        // MARK: No1 Basic Map
        // Map(coordinateRegion: $region)
        
        // MARK: No2 Advanced Map
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
            // (A) Classic old pin style, always static
            // MapPin(coordinate: item.location, tint: .accentColor)
            
            // (B) Marker new style, always static too
            // MapMarker(coordinate: item.location, tint: .accentColor)
            
            // (C) Custom Basic Annotation
            /*
            MapAnnotation(coordinate: item.location) {
                Image("logo")
                    .fit()
                    .frame(width: 32, height: 32, alignment: .center)
                
            } //: Annotation
            */
            // (D) Custom Advanced Annotation
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        })
            .overlay(
                HStack(alignment: .center, spacing: 12) {
                    Image("compass")
                        .fit()
                    .frame(width: 48, height: 48, alignment: .center)
                    
                    VStack(alignment: .leading, spacing: 3) {
                        HStack {
                            Text("Latitude:")
                                .fontWeight(.bold)
                                .font(.footnote)
                                .foregroundColor(.accentColor)
                            Spacer()
                            Text("\(region.center.latitude)")
                        }
                        Divider()
                        HStack {
                            Text("Longitude:")
                                .fontWeight(.bold)
                                .font(.footnote)
                                .foregroundColor(.accentColor)
                            Spacer()
                            Text("\(region.center.longitude)")
                        }
                    } //: VStack
                } //: HStack
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                    .background(
                        Color.black
                            .cornerRadius(8)
                            .opacity(0.6)
                    )
                    .padding(),
                alignment: .top
            )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
