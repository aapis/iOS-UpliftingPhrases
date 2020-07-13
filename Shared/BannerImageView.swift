//
//  BannerImage.swift
//  UpliftingPhrases
//
//  Created by Ryan Priebe on 2020-06-24.
//

import SwiftUI

struct BannerImageView: View {
    @EnvironmentObject var theme: Theme
    
    var body: some View {
        ZStack {
              // commented out until images can be set by the user
//            Image("alt_banner")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
            Rectangle()
                .foregroundColor(theme.highlight)
                .background(LinearGradient(gradient: Gradient(colors: theme.gradient), startPoint: .top, endPoint: .bottom))
                .opacity(0.6)
        }
        .offset(y: -50)
        .frame(height: 250)
    }    
}

struct BannerImage_Previews: PreviewProvider {
    static var previews: some View {
        BannerImageView()
    }
}
