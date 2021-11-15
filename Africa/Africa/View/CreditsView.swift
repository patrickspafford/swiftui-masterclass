//
//  CreditsView.swift
//  Africa
//
//  Created by Patrick Spafford on 11/14/21.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .fit()
                .frame(width: 128, height: 128)
            
            Text("""
    Copyright Patrick Spafford
    All Rights Reserved.
    Better Apps ❤️ Less Code.
    """)
                .font(.footnote)
            .multilineTextAlignment(.center)
        } //: VStack
        .padding()
        .opacity(0.6)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .compact()
    }
}
