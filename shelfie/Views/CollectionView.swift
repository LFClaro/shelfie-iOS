//
//  CollectionView.swift
//  shelfie
//
//  Created by Luiz Fernando Reis on 2022-04-09.
//

import SwiftUI

struct CollectionView: View {
    @State var selectedTab = 0
    let tabs = ["Full View", "List View"]
    
    var body: some View {
        VStack{
            Spacer()
            Spacer()
            Text("Your Virtual Shelf")
                    .font(.custom("Avenir-Black", size: sf.h * 0.04))
                    .frame(maxWidth: .infinity, alignment: .leading)
            
            Tabs(tabs: .constant(tabs), selection: $selectedTab) {title, isSelected in
                Text(title)
                    .frame(maxWidth: sf.w * 0.5)
            }
            ScrollView(.vertical, showsIndicators: false){
                Spacer()
                if (tabs[selectedTab] == "Full View"){
                    VStack(spacing: sf.w * 0.05){
                        CustomCards(roundedCorners: 20, cardName: "Root", image: "gameImageTest", width: sf.w * 0.5, height: sf.h * 0.22, description: "2018  •  2-4 Players  • 60-90 Mins", rankNumber: "#1", heartNumber: "3201", viewsNumber: "3201")
                        CustomCards(roundedCorners: 20, cardName: "Root", image: "gameImageTest", width: sf.w * 0.5, height: sf.h * 0.22, description: "2018  •  2-4 Players  • 60-90 Mins", rankNumber: "#1", heartNumber: "3201", viewsNumber: "3201")
                        CustomCards(roundedCorners: 20, cardName: "Root", image: "gameImageTest", width: sf.w * 0.5, height: sf.h * 0.22, description: "2018  •  2-4 Players  • 60-90 Mins", rankNumber: "#1", heartNumber: "3201", viewsNumber: "3201")
                        CustomCards(roundedCorners: 20, cardName: "Root", image: "gameImageTest", width: sf.w * 0.5, height: sf.h * 0.22, description: "2018  •  2-4 Players  • 60-90 Mins", rankNumber: "#1", heartNumber: "3201", viewsNumber: "3201")
                    }
                    .scaleEffect(1.4)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .position(x: sf.w * 0.45, y: 320)
                } else {
                    VStack{
                        Text("LIST VIEW HERE SOON")
                    }
                }
            }
        }
        .padding(.horizontal)
        .foregroundColor(.white)
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}
