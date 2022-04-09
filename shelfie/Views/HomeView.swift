//
//  HomeView.swift
//  shelfie
//
//  Created by Luiz Fernando Reis on 2022-04-07.
//

import SwiftUI

struct HomeView: View {
    @State var searchText = ""
    @State var cardImage = "https://d2k4q26owzy373.cloudfront.net/350x350/games/uploaded/1629324760985.jpg"
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing:0) {
                Spacer()
                Spacer()
                
                VStack {
                    Text("Build your collection in a snap!")
                        .font(.custom("Avenir-Black", size: sf.h * 0.04))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    CustomTextField(placeHolder: "Search", value: $searchText, roundedCorners: 10, textColor: .white, shadowRadius: 10, fontSize: sf.h * 0.03, bgColor: Color("bgSearchTxtField"), padding: sf.h * 0.02, rightViewImage: "magnifyingglass")
                        .frame(maxWidth: .infinity, idealHeight: sf.h * 0.1, alignment: .center)
                    Text("Browse Categories")
                        .font(.custom("Avenir-Black", size: sf.h * 0.04))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Rectangle().overlay{
                        ZStack{
                            Color("DarkPurple")
                            HStack{
                                Image("cards")
                                Spacer()
                                Image("Dice")
                                Spacer()
                                Image("puzzle")
                                Spacer()
                                Image("partyGames")
                                Spacer()
                                Image("all")
                            }
                            .frame(width: sf.w * 0.86, height: sf.h * 0.1, alignment: .center)
                        }
                    }
                    .cornerRadius(20)
                    .frame(maxWidth: .infinity, idealHeight: sf.h * 0.13, alignment: .center)
                    HStack{
                        Text("Popular Games")
                            .font(.custom("Avenir-Black", size: sf.h * 0.04))
                        Spacer()
                        Text("See Top 100")
                            .font(.custom("Avenir-Black", size: sf.h * 0.02))
                    }
                }.padding(.horizontal)
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 0){
                        Spacer()
                        CustomCards(roundedCorners: 20, cardName: "Root", imageUrl: cardImage, scale: 0.8, rankNumber: "#1", heartNumber: "3201", viewsNumber: "3201")
                        CustomCards(roundedCorners: 20, cardName: "Root", imageUrl: cardImage, scale: 0.8, rankNumber: "#1", heartNumber: "3201", viewsNumber: "3201")
                        CustomCards(roundedCorners: 20, cardName: "Root", imageUrl: cardImage, scale: 0.8, rankNumber: "#1", heartNumber: "3201", viewsNumber: "3201")
                        CustomCards(roundedCorners: 20, cardName: "Root", imageUrl: cardImage, scale: 0.8, rankNumber: "#1", heartNumber: "3201", viewsNumber: "3201")
                        Spacer()
                    }
                }
                .frame(maxWidth: .infinity, minHeight: sf.h * 0.35, alignment: .center)
            }
            //        .foregroundColor(.white)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
