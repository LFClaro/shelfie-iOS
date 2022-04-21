//
//  GameView.swift
//  shelfie
//
//  Created by Luiz Fernando Reis on 2022-04-21.
//

import SwiftUI
import SwiftyJSON

struct GameView: View {
    @Binding var gameId : String
    @StateObject var model = GameViewModel.shared
    @State var gameJSON = JSON()
    
    var body: some View {
        
        ZStack {
            Image("bg")
                .resizable()
                .ignoresSafeArea()
            VStack(spacing:0){
                ZStack{
                    Image("bgPattern")
                        .resizable()
                        .scaledToFill()
                        .frame(maxHeight: sf.h * 0.3)
                        .clipped()
                        .opacity(0.4)
                    Color("DarkPurple")
                        .frame(maxHeight: sf.h * 0.1)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                    if let imageUrl = gameJSON["images"]["original"].stringValue {
                        AsyncImage(url: URL(string: imageUrl)) { image in
                            image.resizable().scaledToFill()
                        } placeholder: {
                            ProgressView()
                                .scaleEffect(6)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    } else {
                        Image("bgPattern")
                            .resizable()
                            .scaledToFill()
                    }
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Game")
                                .font(.custom("Avenir-Black", size: sf.w * 0.07))
                            HStack{
                                Text("2018 • ").font(.caption)
                                Text("2-4 Players • ").font(.caption)
                                Text("60-90 Minutes").font(.caption)
                            }
                        }
                        ButtonView(text: "Buy It!", fontSize: sf.w * 0.05, hTextPadding: 0, color: LinearGradient(colors: [Color("AccentColorTop"), Color("AccentColorBottom")], startPoint: .top, endPoint: .bottom), width: sf.w * 0.35, action: {
                            
                        }, image: "dollarsign.circle.fill")
                    }.padding()
                        .frame(maxHeight: .infinity, alignment: .bottomLeading)
                    Image(systemName: "chevron.backward")
                        .font(.largeTitle.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                }
                .ignoresSafeArea()
                
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        HStack{
                            VStack{
                                Text("3221 people like this")
                                ButtonView(text: "Add to Collection", fontSize: sf.w * 0.04, hTextPadding: 0, color: LinearGradient(colors: [Color("red"), Color("red")], startPoint: .top, endPoint: .bottom), width: sf.w * 0.4, action: {
                                    
                                }, image: "heart.fill")
                            }
                            Spacer()
                            VStack{
                                Text("5789 people want this")
                                ButtonView(text: "Add to Wishlist", fontSize: sf.w * 0.04, hTextPadding: 0, color: LinearGradient(colors: [Color("babyBlue"), Color("babyBlue")], startPoint: .top, endPoint: .bottom), width: sf.w * 0.4, action: {
                                    
                                }, image: "eyes.inverse")
                            }
                        }.padding(.vertical)
                        Group{
                            Text("Description text goes here. Description textdfgfdgfdgfdgfd goes here. Description text goes. Description text goes here. Description text goes here. escription text goes here. Description textdfgfdgfdgfdgfd goes here. Description text goesDeescription text goes here. Description textdfgfdgfdgfdgfd goes here. Description texescription text goes here. Description textdfgfdgfdgfdgfd goes here. Description text goes here.")
                                .font(.custom("Avenir-Black", size: sf.w * 0.05))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal)
                            Spacer()
                            HStack{
                                Text("Images")
                                    .font(.custom("Avenir-Black", size: sf.h * 0.04))
                                Spacer()
                                Button {
                                    //TODO: Image gallery
                                } label: {
                                    HStack{
                                        Text("77")
                                            .font(.custom("Avenir-Black", size: sf.h * 0.02))
                                        Image(systemName: "chevron.forward")
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
//                            gameJSON["year_published"].stringValue,  gameJSON["players"].stringValue,  gameJSON["playtime"].stringValue,
                            //gameJSON["name"].stringValue
                            
                        }
                    }
                }
                .frame(minHeight: sf.h * 0.7)
                .padding(.horizontal)
            }
        }
        .foregroundColor(.white)
        .onAppear {
            model.getGameById(boardgameId: gameId)
            gameJSON = model.games.gameById ?? JSON.null
        }
    }
}

struct GameView_Previews: PreviewProvider {
    @State static var gameId = "TAAifFP590"
    static var previews: some View {
        GameView(gameId: $gameId)
    }
}
