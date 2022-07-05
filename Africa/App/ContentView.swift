//
//  ContentView.swift
//  Africa
//
//  Created by Manuel Martinez on 04/07/22.
//

import SwiftUI

struct ContentView: View {
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    var body: some View {
        NavigationView {
            List {
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets())
                    .listRowSeparator(.hidden)
                    .padding(.bottom, 10)
                ForEach(animals) { item in
                    NavigationLink(destination: AnimalDetailView(animal: item)) {
                        AnimalListItemView(animal: item)
                    }
                }
            }// List
            .listStyle(PlainListStyle())
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
        }// Nav
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
