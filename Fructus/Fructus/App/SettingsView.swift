//
//  SettingsView.swift
//  Fructus
//
//  Created by Patrick Spafford on 10/13/21.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    
    
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    
                    // MARK: - Section 1
                    GroupBox(
                        label:
                            SettingsLabelView(
                                labelText: "Fructus",
                                labelImage: "info.circle"
                            )
                    ) {
                        Divider().padding(.vertical, 4)
                        HStack(alignment: .center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            
                            Text("Most fruits are naturally low in fat, sodium, and calories. None have cholestrol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins, and much more.")
                                .font(.footnote)
                        } //: HStack
                    } //: GroupBox
                    // MARK: - Section 2
                    GroupBox(
                        label:
                            SettingsLabelView(
                                labelText: "Customization",
                                labelImage: "paintbrush"
                            )
                    ) {
                        Divider().padding(.vertical, 4)
                        Text("If you'd like to restart the application, please toggle the below switch.")
                            .padding(.vertical, 8)
                            .frame(minHeight: 60)
                            .multilineTextAlignment(.leading)
                            .font(.footnote)
                            .layoutPriority(1)
                        
                        Toggle(isOn: $isOnboarding) {
                            if isOnboarding {
                                Text("Restarted".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.green)
                                    
                            } else {
                                Text("Restart".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.primary)
                            }
                                

                        } //: Toggle
                        .padding()
                        .background(
                            Color(UIColor.tertiarySystemBackground)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 8, style: .continuous)
                                )
                        )
                    }
                    // MARK: - Section 3
                    
                    GroupBox(
                        label:
                            SettingsLabelView(
                                labelText: "Application",
                                labelImage: "apps.iphone"
                            )
                    ) {
                        SettingsRowView(name: "Developer", content: "Patrick")
                        SettingsRowView(name: "Design", content: "Robert Petras")
                        SettingsRowView(name: "Compatibility", content: "iOS 15")
                        SettingsRowView(name: "Website", linkLabel: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
                        SettingsRowView(name: "SwiftUI", content: "2.0")
                        SettingsRowView(name: "Version", content: "1.1.0")
                    } //: GroupBox
                } //: Vstack
                .navigationBarTitle(Text("Settings"), displayMode: .large)
                .navigationBarItems(
                    trailing:
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "xmark")
                        } //: Button
                )
                .padding()
            } //: ScrollView
        } //: Navigation
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
