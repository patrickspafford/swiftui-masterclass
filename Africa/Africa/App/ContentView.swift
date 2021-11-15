//
//  ContentView.swift
//  Africa
//
//  Created by Patrick Spafford on 10/23/21.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator()
    
    @State private var isGridActive = false
    @State private var gridLayout: [GridItem] = [ GridItem(.flexible()) ]
    @State private var gridColumns: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    // MARK: - Functions
    func gridSwitch() {
        gridLayout = Array(
            repeating: GridItem(.flexible()),
            count: gridLayout.count % 3 + 1
        )
        gridColumns = gridLayout.count
        
        switch gridColumns {
            case 1:
                toolbarIcon = "square.grid.2x2"
                break
            case 2:
                toolbarIcon = "square.grid.3x2"
                break
            case 3:
                toolbarIcon = "rectangle.grid.1x2"
                break
            default:
                toolbarIcon = "square.grid.2x2"
        }
        
    }
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            Group {
                if !isGridActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(
                                EdgeInsets(
                                    top: 0,
                                    leading: 0,
                                    bottom: 0,
                                    trailing: 0
                                )
                            )
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            } //: NavigationLink
                        } //: ForEach
                        CreditsView().modifier(CenterModifier())
                    } // : List
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                        AnimalGridItemView(animal: animal)
                                } //: NavLink
                            } //: ForEach
                        } //: LazyVGrid
                        .padding()
                        .animation(.easeIn)
                    } //: ScrollView
                } //: Conditional
            } //: Group
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        
                        // LIST
                        Button(action: {
                            print("List item activated.")
                            haptics.impactOccurred()
                            isGridActive = false
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(!isGridActive ? .accentColor : .primary)
                        } //: List Button
                        
                        // GRID
                        Button(action: {
                            print("Grid item activated.")
                            haptics.impactOccurred()
                            isGridActive = true
                            gridSwitch()
                        }) {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridActive ? .accentColor : .primary)
                        } //: Grid Button
                        
                        
                    } //: HStack
                } //: ToolbarItem
            } //: Toolbar
        } //: NavigationView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
