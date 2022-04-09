//
//  HomeView.swift
//  shelfie
//
//  Created by Luiz Fernando Reis on 2022-04-07.
//

import SwiftUI

struct HomeView: View {
    @State var searchText = ""
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false){
        VStack{
            Spacer()
            Spacer()
            
            Group{
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
                                .resizable()
                            Spacer()
                            Image("Dice")
                                .resizable()
                            Spacer()
                            Image("puzzle")
                                .resizable()
                            Spacer()
                            Image("partyGames")
                                .resizable()
                            Spacer()
                            Image("all")
                                .resizable()
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
                HStack(spacing: sf.w * 0.1){
                    CustomCards(roundedCorners: 20, cardName: "Root", image: "gameImageTest", description: "2018  •  2-4 Players  • 60-90 Mins", rankNumber: "#1", heartNumber: "3201", viewsNumber: "3201")
                    CustomCards(roundedCorners: 20, cardName: "Root", image: "gameImageTest", description: "2018  •  2-4 Players  • 60-90 Mins", rankNumber: "#1", heartNumber: "3201", viewsNumber: "3201")
                  
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .foregroundColor(.white)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
