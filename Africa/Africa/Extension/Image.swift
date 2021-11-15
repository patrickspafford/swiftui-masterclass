//
//  Image.swift
//  Africa
//
//  Created by Patrick Spafford on 10/26/21.
//

import SwiftUI

extension Image {
    func fit() -> some View {
        return self.resizable().scaledToFit()
    }
}
