//
//  CenterModifier.swift
//  Africa
//
//  Created by Manuel Martinez on 06/07/22.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
