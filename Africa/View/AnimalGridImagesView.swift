//
//  AnimalGridImagesView.swift
//  Africa
//
//  Created by Manuel Martinez on 06/07/22.
//

import SwiftUI

struct AnimalGridImagesView: View {
    let animal: Animal
    
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

struct AnimalGridImagesView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalGridImagesView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
