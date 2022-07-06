//
//  ContentView.swift
//  Africa
//
//  Created by Manuel Martinez on 04/07/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var isGridViewActive: Bool = false
    
    @State private var gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 1)
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    //MARK: - FUNCTIONS
    
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        
        switch gridColumn {
        case 1:
            toolbarIcon = "rectangle.grid.1x2.fill"
        case 2:
            toolbarIcon = "square.grid.2x2.fill"
        case 3:
            toolbarIcon = "square.grid.3x2.fill"
        default:
            toolbarIcon = "square.grid.2x2.fill"
        }
    

    }
    
    var body: some View {
        NavigationView {
            
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets())
                            .listRowSeparator(.hidden)
                            .padding(.bottom, 10)
                        ForEach(animals) { item in
                            NavigationLink(destination: AnimalDetailView(animal: item)) {
                                AnimalListItemView(animal: item)
                            }// Link
                        }// Loop
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            
                            ForEach(animals) { item in
                                NavigationLink(destination: AnimalDetailView(animal: item)) {
                                    AnimalGridImagesView(animal: item)
                                }
                            }// Loop
                        }// Grid
                        .padding(10)
                    }// Scroll
                }// Condition
            }// Group
            .listStyle(PlainListStyle())
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        
                        // LIST
                        Button {
                            isGridViewActive = false
                            haptics.impactOccurred()
                            gridLayout = Array(repeating: GridItem(.flexible()), count: 1)
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }
                        
                        // GRID
                        Button {
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        } label: {
                            Image(systemName: isGridViewActive ? toolbarIcon : "square.grid.2x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }

                    }
                }// Item
            }// ToolBar
        }// Nav
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
