//
//  WatchlistView.swift
//  shelfie
//
//  Created by Ramy Anber on 2022-04-09.
//

import SwiftUI

struct WatchlistView: View {
    @State var selectedTab = 0
    let tabs = ["Full View", "List View"]
    
    var body: some View {
        VStack{
            Spacer()
            Spacer()
            if (tabs[selectedTab] == "Full View"){
                VStack(spacing: sf.w * 0.05){
                    CustomCards(roundedCorners: 20, cardName: "Root", image: "gameImageTest", description: "2018  •  2-4 Players  • 60-90 Mins", rankNumber: "#1", heartNumber: "3201", viewsNumber: "3201")
                        .padding()
                    CustomCards(roundedCorners: 20, cardName: "Root", image: "gameImageTest", description: "2018  •  2-4 Players  • 60-90 Mins", rankNumber: "#1", heartNumber: "3201", viewsNumber: "3201")
                        .padding()
                    CustomCards(roundedCorners: 20, cardName: "Root", image: "gameImageTest", description: "2018  •  2-4 Players  • 60-90 Mins", rankNumber: "#1", heartNumber: "3201", viewsNumber: "3201")
                        .padding()
                    CustomCards(roundedCorners: 20, cardName: "Root", image: "gameImageTest", description: "2018  •  2-4 Players  • 60-90 Mins", rankNumber: "#1", heartNumber: "3201", viewsNumber: "3201")
                        .padding()
                     
                }
            } else {
                VStack{
                    Text("LIST VIEW HERE SOON")
                }
            }
        }
        .foregroundColor(.white)
    }
}

struct WatchlistView_Previews: PreviewProvider {
    static var previews: some View {
        WatchlistView()
    }
}
