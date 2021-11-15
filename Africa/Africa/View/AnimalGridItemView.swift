//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Patrick Spafford on 11/12/21.
//

import SwiftUI

struct AnimalGridItemView: View {
    var animal: AnimalModel
    var body: some View {
        Image(animal.image)
            .fit()
            .cornerRadius(12)
            
    }
}

struct AnimalGridItemView_Previews: PreviewProvider {
    static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        AnimalGridItemView(animal: animals[0])
            .compact()
    }
}
