//
//  BuyView.swift
//  shelfie
//
//  Created by Luiz Fernando Reis on 2022-04-21.
//

import SwiftUI
import SwiftyJSON

struct BuyView: View {
    @State var gameId : String
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var model = BuyViewModel.shared
    @StateObject var gameModel = GameViewModel.shared
    
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
                    if let imageUrl = gameModel.games.gameById?["images"]["original"].stringValue {
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
                            Text("Buy \(gameModel.games.gameById?["name"].stringValue ?? "")")
                                .font(.custom("Avenir-Black", size: sf.w * 0.07))
                        }
                        Spacer()
                    }
                    .padding()
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
                        Spacer()
                        ForEach((model.games.gamePrices?.sorted(by: <) ?? [:].sorted(by: <)), id: \.key) { key, value in
                            let priceDouble = value["price"].doubleValue
                            let twoDecimalsPrice = round(priceDouble * 100) / 100.0
                            
                            HStack{
                                VStack(alignment: .leading){
                                    Text("\(value["store_name"].stringValue)").font(.title2)
                                    Text("\(value["name"].stringValue)").font(.caption)
                                }.padding(.horizontal)
                                Spacer()
                                ButtonView(text: "$\(twoDecimalsPrice)", fontSize: sf.w * 0.04, color: LinearGradient(colors: [Color("AccentColorTop"), Color("AccentColorBottom")], startPoint: .top, endPoint: .bottom), width: sf.w * 0.32, sfSymbol: "dollarsign.circle.fill") {
                                    if let storeURL = URL(string: value["url"].stringValue) {
                                        UIApplication.shared.open(storeURL, options: [:], completionHandler: nil)
                                    }
                                }
                                
                            }
                            .frame(height: 0.06 * sf.h)
                            .frame(maxWidth: . infinity)
                            .background(Color("DarkPurple"))
                            .cornerRadius(30)
                        }
                        Spacer()
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
                model.getGamePricesById(boardgameId: gameId)
            }
        }
    }
}

struct BuyView_Previews: PreviewProvider {
    @State static var gameId = "TAAifFP590"
    static var previews: some View {
        BuyView(gameId: gameId)
    }
}
