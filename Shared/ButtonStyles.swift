//
//  ButtonStyles.swift
//  UpliftingPhrases
//
//  Created by Ryan Priebe on 2020-06-30.
//

import SwiftUI
import Foundation

struct InspireMeButtonStyle: ButtonStyle {
    var theme: Theme
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
                .frame(width: 300, height: 50, alignment: .center)
                .foregroundColor(Color.white)
                .background(theme.highlight)
                .cornerRadius(40)
                .offset(y: -40)
                .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
        }
    }
}

struct FavouriteButtonStyle: ButtonStyle {
    var theme: Theme
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 300, height: 50, alignment: .center)
            .foregroundColor(Color.white)
            .background(theme.highlight)
            .cornerRadius(40)
            .offset(y: -40)
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
    }
}
