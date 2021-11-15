//
//  CenterModifier.swift
//  Africa
//
//  Created by Patrick Spafford on 11/14/21.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
