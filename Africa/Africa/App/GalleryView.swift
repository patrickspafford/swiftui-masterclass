//
//  GalleryView.swift
//  Africa
//
//  Created by Patrick Spafford on 10/23/21.
//

import SwiftUI

struct GalleryView: View {
    
    // MARK: Properties
    
    let animals: [AnimalModel] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var selectedAnimal: String = "lion"
    
    // Simple Grid Definition
    
    // let gridLayout: [GridItem] = [
    //     GridItem(.flexible()),
    //     GridItem(.flexible()),
    //     GridItem(.flexible())
    // ]
    
    // Efficient Def
    
    /*
    let gridLayout: [GridItem] = Array(
        repeating: GridItem(
            .flexible()),
            count: 3
    )
     */
    
    // Dynamic Grid
    @State private var gridLayout = [GridItem(.flexible())]
    @State private var gridColumns: Double = 3.0
    
    // MARK: Functions
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumns))
    }
    
    
    // MARK: Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 30) {
                
                // MARK: Image
                Image(selectedAnimal)
                    .fit()
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 8)
                    )
                
                // MARK: Slider
                Slider(value: $gridColumns, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColumns, perform: { value in
                        gridSwitch()
                    })
                
                // MARK: Grid
                
                LazyVGrid(
                    columns: gridLayout,
                    alignment: .center,
                    spacing: 10
                ) {
                    ForEach(animals) { animal in
                        Image(animal.image)
                            .fit()
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 1)
                            )
                            .onTapGesture {
                                selectedAnimal = animal.image
                                haptics.impactOccurred()
                            }
                            
                    }
            } //: LazyVGrid
                .animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                })
            } //: VStack
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        } //: Scroll
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            MotionAnimationView()
        )
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
