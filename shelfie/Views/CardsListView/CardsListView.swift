//
//  CollectionView.swift
//  shelfie
//
//  Created by Luiz Fernando Reis on 2022-04-09.
//

import SwiftUI

struct CardsListView: View {
    
    @State var cardImage = "https://d2k4q26owzy373.cloudfront.net/350x350/games/uploaded/1629324760985.jpg"
    @State var rowImage = "https://d2k4q26owzy373.cloudfront.net/350x350/games/uploaded/1629324722072.jpg"
    var handleStatus: ()-> (Binding<String>?, Binding<Int>?, Binding<Bool>?, Binding<String?>?) = {
        return (nil, nil, nil, nil)
    }
    let tabs = ["Full View", "List View"]
    
    var body: some View {
        VStack{
            Spacer()
            Spacer()
            if handleStatus().1?.wrappedValue ?? 0 == 0 {
                VStack(spacing: sf.w * 0.05){
                    CustomCards(roundedCorners: 20, gameName: "Root", imageUrl: cardImage, rankNumber: handleStatus().3?.wrappedValue ?? nil, heartNumber: "3201", watchlistNumber: "3201", showForSale: handleStatus().2?.wrappedValue ?? false)
                    CustomCards(roundedCorners: 20, gameName: "Root", imageUrl: cardImage, rankNumber: handleStatus().3?.wrappedValue ?? nil, heartNumber: "3201", watchlistNumber: "3201", showForSale: handleStatus().2?.wrappedValue ?? false)
                    CustomCards(roundedCorners: 20, gameName: "Root", imageUrl: cardImage, rankNumber: handleStatus().3?.wrappedValue ?? nil, heartNumber: "3201", watchlistNumber: "3201", showForSale: handleStatus().2?.wrappedValue ?? false)
                    CustomCards(roundedCorners: 20, gameName: "Root", imageUrl: cardImage, rankNumber: handleStatus().3?.wrappedValue ?? nil, heartNumber: "3201", watchlistNumber: "3201", showForSale: handleStatus().2?.wrappedValue ?? false)
                }
            }else{
                VStack (spacing: 20){
                    CustomRows(roundedCorners: 60, gameName: "Catan", imageUrl: rowImage, infoPlayers: "2-4", infoTime: "60-90", showHeart: false, showEyes: false, showForSale: false)
                    CustomRows(roundedCorners: 60, gameName: "Catan", imageUrl: rowImage, infoPlayers: "2-4", infoTime: "60-90", showHeart: false, showEyes: false, showForSale: false)
                    CustomRows(roundedCorners: 60, gameName: "Catan", imageUrl: rowImage, infoPlayers: "2-4", infoTime: "60-90", showHeart: false, showEyes: false, showForSale: false)
                    CustomRows(roundedCorners: 60, gameName: "Catan", imageUrl: rowImage, infoPlayers: "2-4", infoTime: "60-90", showHeart: false, showEyes: false, showForSale: false)
                }
            }
        }
    }
    
    
    @ViewBuilder
    func generateTabs(selectedTab: Binding<Int>)-> some View {
        Tabs(tabs: .constant(tabs), selection: selectedTab) {title, isSelected in
            Text(title)
                .frame(maxWidth: sf.w * 0.5)
        }
        .scaleEffect(0.6)
    }
}

struct CardsListView_Previews: PreviewProvider {
    static var previews: some View {
        CardsListView {
            return (nil, nil, nil, nil)
        }
    }
}
