//
//  CoverImageView.swift
//  Africa
//
//  Created by Patrick Spafford on 10/23/21.
//

import SwiftUI

struct CoverImageView: View {
    // MARK: - Properties
    let coverImages: [CoverImageModel] = Bundle.main.decode("covers.json")
    // MARK: - Body
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name).fit()
            } //: Loop
        } //: TabView
        .tabViewStyle(PageTabViewStyle())
    }
}

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .fixed(width: 400, height: 300)
    }
}
