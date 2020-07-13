//
//  ContentView.swift
//  Shared
//
//  Created by Ryan Priebe on 2020-06-24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: QuotesModel
    @EnvironmentObject var theme: Theme
    
    @State var currentIndex: Int = 0
    @State var showToast: Bool = false
    
    var body: some View {
        var popover: [String: Any] = [
            "text": Text("You loved this quote"),
            "icon": "heart"
        ]
        
        if !isLoved() {
            popover["text"] = Text("Removed from your favourites")
            popover["icon"] = "heart.slash"
        }
        
        return ZStack {
            VStack {
                BannerImageView()
                
                AuthorView(name: author())
                    .offset(y: -150)
                    .padding(.bottom, -130)

                QuoteView(quote: quote())
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button("Inspire Me", action: next)
                        .buttonStyle(InspireMeButtonStyle(theme: theme))
                    Spacer()
                        
                }
            }
            .navigationBarTitle("All Quotes", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: love) {
                    HStack {
                        Image(systemName: isLoved() ? "heart.fill" : "heart")
                            .accentColor(theme.highlight)
                    }
                }
                
            )
        }
        .toast(isShowing: $showToast, text: popover["text"] as! Text, icon: popover["icon"] as! String)
//        .animation(.spring())
//        .blur(radius: shown ? 20 : 0)
        
    }
    
    func author() -> String {
        model.all()[currentIndex].author
    }
    
    func quote() -> String {
        model.all()[currentIndex].text
    }
    
    func favourite() -> Bool {
        model.all()[currentIndex].favourite
    }
    
    func next() -> Void {
        let lastIndex: Int = self.currentIndex
        self.currentIndex = chooseRandomIndex()
        
        // never show duplicate phrases
        if lastIndex == self.currentIndex {
            self.currentIndex = chooseRandomIndex()
        }
    }
    
    func chooseRandomIndex() -> Int {
        return Int.random(in: 0..<model.all().count)
    }
    
    func love() -> Void {
        let current = model.all()[self.currentIndex]
        
        if current.favourite {
            model.list[self.currentIndex].favourite = false
        } else {
            model.list[self.currentIndex].favourite = true
        }
        
        withAnimation {
            self.showToast.toggle()
        }
    }
    
    func isLoved() -> Bool {
        return model.all()[self.currentIndex].favourite == true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
