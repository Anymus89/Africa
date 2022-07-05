//
//  ExternalWebLink.swift
//  Africa
//
//  Created by Manuel Martinez on 05/07/22.
//

import SwiftUI

struct ExternalWebLink: View {
    
    let animal: Animal
    
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wikipedia")
                Spacer()
                Group {
                    Link(animal.name, destination: (URL(string: animal.link) ?? URL(string: "https://wikipedia.org"))!)
                    Image(systemName: "arrow.up.right.square")
                }
                .foregroundColor(.accentColor)
            }// HStack
        }// Box
    }
}

struct ExternalWebLink_Previews: PreviewProvider {
    static var animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        ExternalWebLink(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
