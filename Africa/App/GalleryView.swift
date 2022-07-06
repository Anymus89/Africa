//
//  GalleryView.swift
//  Africa
//
//  Created by Manuel Martinez on 04/07/22.
//

import SwiftUI

struct GalleryView: View {
    // MARK: - PROPERTIES
    @State private var selectedAnimal: String = "lion"
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColum: Double = 3.0
    
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColum))
    }
    
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(alignment: .center, spacing: 30) {
                
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))

                Slider(value: $gridColum, in: 2...4, step: 1)
                    .padding(.horizontal)
                    .onChange(of: gridColum) { _ in
                        gridSwitch()
                    }
                
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    
                    ForEach(animals) { item in
                        
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                            }
                    }// Loop
                    
                }// Grid
                .animation(.easeIn)
                .onAppear {
                    gridSwitch()
                }
            }// VStack
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
