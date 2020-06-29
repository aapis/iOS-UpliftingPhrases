//
//  ContentView.swift
//  Shared
//
//  Created by Ryan Priebe on 2020-06-24.
//

import SwiftUI

struct ContentView: View {
    var data: [Quote]
    
    @State var quote: String = Quotes.first?.text ?? "I can't do that"
    @State var author: String = Quotes.first?.author ?? "HAL 9000"
    @State var favourite: Bool = Quotes.first?.favourite ?? false
    @State var currentIndex: Int = 0
    @State var scheme: ColourScheme = ColourScheme()
    
    var body: some View {
        VStack {
            BannerImageView(scheme: scheme)
            
            AuthorView(scheme: scheme, name: self.author)
                .offset(y: -150)
                .padding(.bottom, -130)

            QuoteView(scheme: scheme, quote: self.quote)
            
            Spacer()
            
            HStack {
                Spacer()
                
                Button("Inspire Me", action: next)
                    .buttonStyle(InspireMeButtonStyle(scheme: scheme))
                Spacer()
                
                Button(action: love) {
                    HStack {
                        Image(systemName: isLoved() ? "heart.fill" : "heart")
                    }
                }
                    
            }
        }
        .navigationBarTitle("All", displayMode: .inline)
    }
    
    func next() -> Void {
        let lastIndex: Int = self.currentIndex
        self.currentIndex = chooseRandomIndex()
        
        // never show duplicate phrases
        if lastIndex == self.currentIndex {
            self.currentIndex = chooseRandomIndex()
        }
        
        self.quote = Quotes[self.currentIndex].text
        self.author = Quotes[self.currentIndex].author
    }
    
    func chooseRandomIndex() -> Int {
        return Int.random(in: 0..<phrases.count)
    }
    
    func love() -> Void {
        Quotes[self.currentIndex].favourite = true
    }
    
    func isLoved() -> Bool {
        return Quotes[self.currentIndex].favourite == true
    }
}

struct InspireMeButtonStyle: ButtonStyle {
    var scheme: ColourScheme
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
                .frame(width: 300, height: 50, alignment: .center)
                .foregroundColor(Color.white)
                .background(scheme.highlight)
                .cornerRadius(40)
                .offset(y: -40)
                .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
        }
    }
}

struct FavouriteButtonStyle: ButtonStyle {
    var scheme: ColourScheme
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 300, height: 50, alignment: .center)
            .foregroundColor(Color.white)
            .background(scheme.highlight)
            .cornerRadius(40)
            .offset(y: -40)
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(data: Quotes)
    }
}
