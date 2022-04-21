//
//  HomeView.swift
//  shelfie
//
//  Created by Luiz Fernando Reis on 2022-04-07.
//

import SwiftUI
import SwiftyJSON

struct HomeView: View {
    
    @StateObject var model = HomeViewModel.shared
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
                    CustomTextField(placeHolder: "Search", value: $searchText, roundedCorners: 10, textColor: .white, shadowRadius: 10, fontSize: sf.h * 0.03, bgColor: Color("bgSearchTxtField"), padding: sf.h * 0.02, rightViewImage: "magnifyingglass",changedValue: $searchText ,performChanged: { v in
                        print(v)
                    })
                        .frame(maxWidth: .infinity, idealHeight: sf.h * 0.1, alignment: .center)
                    Text("Browse Categories")
                        .font(.custom("Avenir-Black", size: sf.h * 0.04))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Rectangle().overlay{
                        ZStack{
                            Color("DarkPurple")
                            HStack{
                                Spacer()
                                Button {
                                    
                                } label: {
                                    Image("cards")
                                        .resizable().scaledToFit()
                                }
                                Button {
                                    
                                } label: {
                                    Image("Dice")
                                        .resizable().scaledToFit()
                                }
                                Button {
                                    
                                } label: {
                                    Image("puzzle")
                                        .resizable().scaledToFit()
                                }
                                Button {
                                    
                                } label: {
                                    Image("party")
                                        .resizable().scaledToFit()
                                }
//                                Button {
//
//                                } label: {
//                                    Image("all")
//                                        .resizable().scaledToFit()
//                                }
                                Spacer()
                            }
                            .frame(width: sf.w * 0.86, height: sf.h * 0.1, alignment: .center)
                        }
                    }
                    .cornerRadius(20)
                    .frame(maxWidth: .infinity, idealHeight: sf.h * 0.13, alignment: .center)
                    HStack{
                        Text("Popular Games")
                            .font(.custom("Avenir-Black", size: sf.h * 0.035))
                            .fixedSize(horizontal: true, vertical: false)
                        Spacer()
                        Text("See Top 100")
                            .font(.custom("Avenir-Black", size: sf.h * 0.02))
                            .fixedSize(horizontal: true, vertical: false)
                    }
                }.padding(.horizontal)
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: sf.w * 0.05){
                        Spacer()
                        ForEach((model.games.topGames?.sorted(by: <) ?? [:].sorted(by: <)), id: \.key) { key, value in
                            CustomCards(roundedCorners: 60, gameName: value["name"].stringValue, imageUrl: value["images"]["original"].stringValue, infoYear: value["year_published"].stringValue, infoPlayers: value["players"].stringValue, infoTime: value["playtime"].stringValue, rankNumber: value["rank"].stringValue, heartNumber: value["num_user_ratings"].stringValue, watchlistNumber: value["lists"].stringValue, showForSale: true)
                            }
                        }
                        Spacer()
                    }.onAppear {
                        model.getTopGames()
                }
                .frame(maxWidth: .infinity, minHeight: sf.h * 0.28, alignment: .center)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
