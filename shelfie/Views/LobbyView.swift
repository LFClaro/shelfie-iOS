//
//  LobbyView.swift
//  shelfie
//
//  Created by Ramy Anber on 2022-03-25.
//

import SwiftUI

struct LobbyView: View {
    @State var searchText = ""
    
    var body: some View {
        ZStack{
            Image("bg")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            ScrollView(.vertical){
                VStack{
                    HStack{
                        Image("logoShelfieWhite")
                                .resizable()
                                .scaledToFit()
                        ProfileView(imageUrl: "")
                    }
                    
                    Spacer()
                    Spacer()
                    
                    Text("Build your collection in a snap!")
                        .font(.custom("Avenir-Black", size: sf.h * 0.04))
                        .foregroundColor(.white)
                    CustomTextField(placeHolder: "Search", value: $searchText, roundedCorners: 10, textColor: .white, shadowRadius: 10, fontSize: sf.h * 0.03, bgColor: Color("bgSearchTxtField"), padding: sf.h * 0.02, rightViewImage: "magnifyingglass")
                        .frame(width: sf.w * 0.8, height: sf.h * 0.1, alignment: .center)
                    Text("Browse Categories")
                        .font(.custom("Avenir-Black", size: sf.h * 0.04))
                        .foregroundColor(.white)
                        .frame(width: sf.w * 0.95, alignment: .leading)
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
                            }.frame(width: sf.w * 0.86, height: sf.h * 0.1, alignment: .center)
                        }
                    }.cornerRadius(20)
                    .frame(width: sf.w * 0.9, height: sf.h * 0.13, alignment: .center)
                    Text("Popular Games")
                        .font(.custom("Avenir-Black", size: sf.h * 0.04))
                        .foregroundColor(.white)
                        .frame(width: sf.w * 0.95, alignment: .topLeading)
                    ScrollView(.horizontal){
                        HStack(spacing: 100){
                            CustomCards(roundedCornes: 20, cardName: "Root", image: "gameImageTest", width: sf.w * 0.5, height: sf.h * 0.22, description: "2018  •  2-4 Players  • 60-90 Mins", rankNumber: "#1", heartNumber: "3201", viewsNumber: "3201")
                            CustomCards(roundedCornes: 20, cardName: "Root", image: "gameImageTest", width: sf.w * 0.5, height: sf.h * 0.22, description: "2018  •  2-4 Players  • 60-90 Mins", rankNumber: "#1", heartNumber: "3201", viewsNumber: "3201")
                        }
                    }.frame(width: sf.w * 1, height: sf.h * 0.25, alignment: .center)
                }
            }
          
        }
    }
}

struct LobbyView_Previews: PreviewProvider {
    static var previews: some View {
        LobbyView()
    }
}
