//
//  SettingsRowView.swift
//  Fructus
//
//  Created by Patrick Spafford on 10/14/21.
//

import SwiftUI

struct SettingsRowView: View {
    // MARK: - Properties
    var name: String
    var content: String?
    var linkLabel: String?
    var linkDestination: String?
    // MARK: - Body
    var body: some View {
        VStack {
            Divider().padding(.vertical, 4)
            HStack {
                Text(name).foregroundColor(Color.gray)
                Spacer()
                if let textContent = content {
                    Text(textContent)
                } else if let safeLinkLabel = linkLabel, let safeDestination = linkDestination {
                    Link(safeLinkLabel, destination: URL(string: "https://\(safeDestination)")!)
                    Image(systemName: "arrow.up.right.square").foregroundColor(.pink)
                } else {
                    /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                }
            } //: HStack
        } //: VStack
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsRowView(name: "Developer", content: "Patrick")
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 375, height: 60))
            .padding()
            SettingsRowView(name: "Website", linkLabel: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
        }
    }
}
