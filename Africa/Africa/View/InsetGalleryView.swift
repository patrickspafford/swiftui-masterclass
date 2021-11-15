//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Patrick Spafford on 10/26/21.
//

import SwiftUI

struct InsetGalleryView: View {
    // MARK: - Properties
    
    // MARK: - Body
    let animal: AnimalModel
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
        HStack(alignment: .center, spacing: 15 ) {
            ForEach(animal.gallery, id: \.self) { photo in
                Image(photo)
                    .fit()
                    .frame(height: 200)
                .cornerRadius(12)
            }
        } //: HStack
        } //: ScrollView
    }
    
}

struct InsetGalleryView_Previews: PreviewProvider {
    static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetGalleryView(animal: animals[0])
            .compact()
    }
}
