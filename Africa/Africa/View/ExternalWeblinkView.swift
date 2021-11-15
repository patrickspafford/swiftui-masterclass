//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by Patrick Spafford on 11/8/21.
//

import SwiftUI

struct ExternalWeblinkView: View {
    // MARK: Properties
    let animal: AnimalModel
    
    // MARK: Body
    var body: some View {
        Group {
            HStack {
                Image(systemName: "globe")
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Spacer()
                
                Group {
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name, destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!)
                    
                }.foregroundColor(.accentColor)
            } //: HStack
        } //: Group
    }
}

struct ExternalWeblinkView_Previews: PreviewProvider {
    static let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ExternalWeblinkView(animal: animals[0])
            .compact()
    }
}
