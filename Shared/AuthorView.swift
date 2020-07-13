//
//  AuthorView.swift
//  UpliftingPhrases
//
//  Created by Ryan Priebe on 2020-06-24.
//

import SwiftUI

struct AuthorView: View {
    @EnvironmentObject var theme: Theme
    
    var name: String
    
    var body: some View {
        VStack {
            Image(name)
                .resizable()
                .frame(width: 130, height: 130)
                .scaledToFit()
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 6), alignment: .center)
                .shadow(radius: 10)
                .padding()
            
            Text(name)
                .font(.title)
                .foregroundColor(theme.highlight)
        }
    }
}

struct AuthorView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AuthorView(name: "Martin Luther King Jr.")
            AuthorView(name: "Maya Angelou")
            AuthorView(name: "Mahatma Gandhi")
            AuthorView(name: "Oscar Wilde")
            AuthorView(name: "Eleanor Roosevelt")
            AuthorView(name: "William W. Purkey")
        }
    }
}
