//
//  CollectionView.swift
//  shelfie
//
//  Created by Luiz Fernando Reis on 2022-04-09.
//

import SwiftUI

struct CollectionView: View {
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
                        CustomCards(roundedCorners: 20, gameName: "Root", imageUrl: cardImage, heartNumber: "3201", viewsNumber: "3201", showForSale: false)
                        CustomCards(roundedCorners: 20, gameName: "Root", imageUrl: cardImage, heartNumber: "3201", viewsNumber: "3201", showForSale: false)
                        CustomCards(roundedCorners: 20, gameName: "Root", imageUrl: cardImage, heartNumber: "3201", viewsNumber: "3201", showForSale: false)
                        CustomCards(roundedCorners: 20, gameName: "Root", imageUrl: cardImage, heartNumber: "3201", viewsNumber: "3201", showForSale: false)
                    }
                } else {
                    VStack (spacing: 20){
                        CustomRows(roundedCorners: 60, gameName: "Catan", imageUrl: rowImage, infoPlayers: "2-4", infoTime: "60-90", showHeart: false, showEyes: false, showForSale: false)
                        CustomRows(roundedCorners: 60, gameName: "Catan", imageUrl: rowImage, infoPlayers: "2-4", infoTime: "60-90", showHeart: false, showEyes: false, showForSale: false)
                        CustomRows(roundedCorners: 60, gameName: "Catan", imageUrl: rowImage, infoPlayers: "2-4", infoTime: "60-90", showHeart: false, showEyes: false, showForSale: false)
                        CustomRows(roundedCorners: 60, gameName: "Catan", imageUrl: rowImage, infoPlayers: "2-4", infoTime: "60-90", showHeart: false, showEyes: false, showForSale: false)
                    }
            }
        }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}
