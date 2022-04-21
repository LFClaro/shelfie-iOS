//
//  GameView.swift
//  shelfie
//
//  Created by Luiz Fernando Reis on 2022-04-21.
//

import SwiftUI
import SwiftyJSON

struct GameView: View {
    @State var gameId : String
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var model = GameViewModel.shared
    
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
                    if let imageUrl = model.games.gameById?["images"]["original"].stringValue {
                        AsyncImage(url: URL(string: imageUrl)) { image in
                            image.resizable().scaledToFit()
                                .frame(maxHeight: sf.h * 0.3)
                        } placeholder: {
                            ProgressView()
                                .scaleEffect(4)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    }
                    Color("bgSearchTxtField")
                        .frame(maxHeight: sf.h * 0.1)
                        .frame(maxHeight: .infinity, alignment: .bottom)
                    HStack {
                        VStack(alignment: .leading) {
                            Text("\(model.games.gameById?["name"].stringValue ?? "")")
                                .font(.custom("Avenir-Black", size: sf.w * 0.07))
                            HStack{
                                Text("\(model.games.gameById?["year_published"].stringValue ?? "") • ").font(.caption)
                                Text("\(model.games.gameById?["players"].stringValue ?? "") Players • ").font(.caption)
                                Text("\(model.games.gameById?["playtime"].stringValue ?? "") Minutes").font(.caption)
                            }
                        }
                        NavigationLink(destination: BuyView(gameId: gameId)) {
                            HStack{
                                Image(systemName: "dollarsign.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(alignment: .leading)
                                    .padding(5)
                                Text("Buy It!")
                                    .font(Font.custom("Avenir-Black", size: sf.w * 0.045))
                            }
                            .frame(width: sf.w * 0.3, height: 0.06 * sf.h)
                            .background(LinearGradient(colors: [Color("AccentColorTop"), Color("AccentColorBottom")], startPoint: .top, endPoint: .bottom))
                            .cornerRadius(30)
                            .shadow(color: Color.black.opacity(0.5), radius: 2, x: 1, y: 1)
                        }
                    }.padding()
                        .frame(maxHeight: .infinity, alignment: .bottomLeading)
                    Button(action: {self.presentationMode.wrappedValue.dismiss()}) {
                        Image(systemName: "chevron.backward")
                            .font(.largeTitle.bold())
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                    }
                }
                .ignoresSafeArea()
                
                ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        HStack{
                            VStack{
                                Text("\(model.games.gameById?["num_user_ratings"].stringValue.htmlToString ?? "") people have it")
                                ButtonView(text: "Add to Collection", fontSize: sf.w * 0.04, color: LinearGradient(colors: [Color("red"), Color("red")], startPoint: .top, endPoint: .bottom), width: sf.w * 0.4, sfSymbol: "heart.fill") {
                                    
                                }
                            }
                            Spacer()
                            VStack{
                                Text("\(model.games.gameById?["lists"].stringValue.htmlToString ?? "") people want it")
                                ButtonView(text: "Add to Wishlist", fontSize: sf.w * 0.04, color: LinearGradient(colors: [Color("babyBlue"), Color("babyBlue")], startPoint: .top, endPoint: .bottom), width: sf.w * 0.4, sfSymbol: "eyes") {
                                    
                                }
                            }
                        }.padding(.vertical)
                        Group{
                            Text(model.games.gameById?["description"].stringValue.htmlToString ?? "")
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
                                        Text(model.games.gameImages?["count"]?.stringValue ?? "")
                                            .font(.custom("Avenir-Black", size: sf.h * 0.02))
                                        Image(systemName: "chevron.forward")
                                    }
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach((model.games.gameImages?.sorted(by: <) ?? [:].sorted(by: <)), id: \.key) { key, img in
                                        if let small = img["small"].stringValue {
                                            AsyncImage(url: URL(string: small)) { image in
                                                image.resizable().scaledToFit()
                                                    .frame(maxWidth: sf.w * 0.3)
                                            } placeholder: {
                                                ProgressView()
                                                    .scaleEffect(3)
                                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                            }
                                            .cornerRadius(30)
                                        }
                                    }
                                }
                            }
                            .frame(maxHeight: sf.h * 0.2)
                        }
                    }
                }
                .frame(minHeight: sf.h * 0.7)
                .padding(.horizontal)
            }
        }
        .navigationBarHidden(true)
        .foregroundColor(.white)
        .onAppear {
            Task{
                model.getGameById(boardgameId: gameId)
                model.getGameImagesById(boardgameId: gameId)
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    @State static var gameId = "TAAifFP590"
    static var previews: some View {
        GameView(gameId: gameId)
    }
}
