//
//  WatchlistView.swift
//  shelfie
//
//  Created by Ramy Anber on 2022-04-09.
//

import SwiftUI

struct WatchlistView: View {
    @State var cardImage = "https://d2k4q26owzy373.cloudfront.net/350x350/games/uploaded/1629324760985.jpg"
    @State var rowImage = "https://d2k4q26owzy373.cloudfront.net/350x350/games/uploaded/1629324722072.jpg"
    @State var selectedTab = 0
    let tabs = ["Full View", "List View"]
    
    var body: some View {
        VStack{
            Spacer()
            Spacer()
            if (tabs[selectedTab] == "Full View"){
                VStack(spacing: sf.w * 0.05){
                    CustomCards(roundedCorners: 60, cardName: "Root", imageUrl: cardImage, rankNumber: "#1", heartNumber: "3201", viewsNumber: "3201", showForSale: true)
                    CustomCards(roundedCorners: 60, cardName: "Root", imageUrl: cardImage, rankNumber: "#1", heartNumber: "3201", viewsNumber: "3201", showForSale: true)
                    CustomCards(roundedCorners: 60, cardName: "Root", imageUrl: cardImage, rankNumber: "#1", heartNumber: "3201", viewsNumber: "3201", showForSale: true)
                    CustomCards(roundedCorners: 60, cardName: "Root", imageUrl: cardImage, rankNumber: "#1", heartNumber: "3201", viewsNumber: "3201", showForSale: true)
                }
            } else {
                VStack (spacing: 20){
                    CustomRows(roundedCorners: 60, cardName: "Catan", imageUrl: rowImage, infoPlayers: "2-4", infoTime: "60-90", showHeart: true, showEyes: false, showForSale: true)
                    CustomRows(roundedCorners: 60, cardName: "Catan", imageUrl: rowImage, infoPlayers: "2-4", infoTime: "60-90", showHeart: true, showEyes: false, showForSale: true)
                    CustomRows(roundedCorners: 60, cardName: "Catan", imageUrl: rowImage, infoPlayers: "2-4", infoTime: "60-90", showHeart: true, showEyes: false, showForSale: true)
                    CustomRows(roundedCorners: 60, cardName: "Catan", imageUrl: rowImage, infoPlayers: "2-4", infoTime: "60-90", showHeart: true, showEyes: false, showForSale: true)
                }
            }
        }
    }
}

struct WatchlistView_Previews: PreviewProvider {
    static var previews: some View {
        WatchlistView()
    }
}
