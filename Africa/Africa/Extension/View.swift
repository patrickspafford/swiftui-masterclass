//
//  PreviewProvider.swift
//  Africa
//
//  Created by Patrick Spafford on 10/26/21.
//

import SwiftUI

extension View {
    // MARK: - Preview Layout Shortcuts
    func compact() -> some View {
        return self.previewLayout(.sizeThatFits).padding()
    }
    
    func fixed(width: CGFloat, height: CGFloat) -> some View {
        return self.previewLayout(.fixed(width: width, height: height))
    }
}
