//
//  InsetFactView.swift
//  Africa
//
//  Created by Patrick Spafford on 10/26/21.
//

import SwiftUI

struct InsetFactView: View {
    // MARK: Properties
    let animal: AnimalModel
    // MARK: Body
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { factItem in
                    Text(factItem)
                }
            } //: TabView
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        } //: GroupBox
    }
}

struct InsetFactView_Previews: PreviewProvider {
    static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetFactView(animal: animals[0])
            .compact()
    }
}
