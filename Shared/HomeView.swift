//
//  HomeView.swift
//  UpliftingPhrases
//
//  Created by Ryan Priebe on 2020-06-28.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
//            FeaturedQuoteView()
            ListView()
        }
        
    }
}

struct FeaturedQuoteView: View {
    var body: some View {
        Text("HELLO")
    }
}

struct ListView: View {
    @EnvironmentObject var model: QuotesModel
    @EnvironmentObject var theme: Theme
    
    @State private var selectedView: Int? = 0
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: ContentView(), tag: 1, selection: self.$selectedView) {
                    HStack {
                        Image(systemName: "list.bullet")
                            .foregroundColor(theme.highlight)
                        Text("All Quotes")
                        Spacer()
                        Text("\(model.all().count)")
                    }
                }
                
                NavigationLink(destination: FavouritesView(), tag: 2, selection: self.$selectedView) {
                    HStack {
                        Image(systemName: "heart")
                            .foregroundColor(theme.highlight)
                        Text("Favourites")
                        Spacer()
                        Text("\(model.favourites().count)")
                    }
                }
            }
            .listStyle(SidebarListStyle())
            .navigationBarTitle("Daily Inspiration")
        }
        .onAppear() {            
            if DeviceHelper.isiPad() && DeviceHelper.isLandscape() {
                self.selectedView = 1
            } else {
                self.selectedView = 0
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
