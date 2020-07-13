//
//  FavouritedView.swift
//  UpliftingPhrases
//
//  Created by Ryan Priebe on 2020-07-01.
//

import SwiftUI

struct Toast<Presenting>: View where Presenting: View {
    let theme: Theme
    let presenting: () -> Presenting
    let text: Text
    let icon: String
    
    @Binding var isShowing: Bool
    
    var body: some View {
        if self.isShowing {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    self.isShowing = false
                }
            }
        }
        
        return ZStack(alignment: .center) {
            self.presenting()
                .blur(radius: self.isShowing ? 15 : 0)

            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color.white)
                    
                    Rectangle()
                        .fill(theme.highlight)
                        .opacity(0.5)

                    VStack {
                        Image(systemName: icon)
                            .resizable()
                            .frame(width: 100, height: 100)

                        Text("\(text)")
                            .offset(y: 20)
                    }
                }
                .frame(width: 250, height: 250)
                .cornerRadius(20)
            }
            .transition(.slide)
            .opacity(self.isShowing ? 1 : 0)
        }
    }
}

extension View {
    func toast(isShowing: Binding<Bool>, text: Text, icon: String) -> some View {
        Toast(theme: Theme(),
              presenting: { self },
              text: text,
              icon: icon,
              isShowing: isShowing
        )
    }
}

//struct FavouritedAlert_Previews: PreviewProvider {
//    static var previews: some View {
//        FavouritedAlert(theme: Theme())
//    }
//}
