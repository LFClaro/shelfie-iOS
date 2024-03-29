//
//  CustomCards.swift
//  shelfie
//
//  Created by Ramy Anber on 2022-03-25.
//

import SwiftUI

struct CustomCards: View {
    var roundedCorners: CGFloat?
    var startColor: Color?
    var endColor: Color?
    var gameId: String?
    var gameName: String?
    var imageUrl: String?
    var infoYear: String?
    var infoPlayers: String?
    var infoTime: String?
    var rankNumber: String?
    var heartNumber: String?
    var watchlistNumber: String?
    var showForSale = true
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: roundedCorners ?? 20)
                .overlay(content: {
                    ZStack{
                        GeometryReader {geo in
                            let geoW = geo.size.width
                            let geoH = geo.size.height
                            Color("DarkPurple")
                            
                                VStack (spacing:0) {
                                    ZStack{
                                        Group {
                                            if imageUrl != nil {
                                                AsyncImage(url: URL(string: imageUrl ?? "")) { image in
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
                                        }
                                        .frame(height: geoH / 1.5)
                                        .clipped()
                                        if (rankNumber != nil) {
                                            Text(rankNumber ?? "#1")
                                                .font(.custom("Avenir-Black", size: geoH / 9.5))
                                                .frame(width: geoW / 5, height: geoH / 9.5, alignment: .center)
                                                .padding(3)
                                                .background(Color("green"))
                                                .cornerRadius(20)
                                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                                                .padding()
                                        }
                                        HStack{
                                            if (heartNumber != nil) {
                                                HStack{
                                                    Image(systemName: "heart.fill")
                                                        .font(.custom("Avenir-Black", size: geoH / 14))
                                                    Text(heartNumber ?? "3254")
                                                        .font(.custom("Avenir-Black", size: geoW / 18))
                                                }
                                                .frame(width: geoW / 3.8, height: geoH / 9, alignment: .center)
                                                .padding(3)
                                                .background(Color("red"))
                                                .cornerRadius(20)
                                            }
                                            Spacer()
                                            if (watchlistNumber != nil) {
                                                HStack{
                                                    Image(systemName: "eyes")
                                                        .font(.custom("Avenir-Black", size: geoH / 14))
                                                    Text(watchlistNumber ?? "3254")
                                                        .font(.custom("Avenir-Black", size: geoW / 18))
                                                }
                                                .frame(width: geoW / 3.4, height: geoH / 9, alignment: .center)
                                                .padding(3)
                                                .background(Color("babyBlue"))
                                                .cornerRadius(20)
                                            }
                                        }
                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                                        .padding()
                                    }
                                    HStack{
                                        VStack (spacing:0){
                                            Text(gameName ?? "Root")
                                                .font(.custom("Avenir-Black", size: geoH / 10))
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                                .fixedSize(horizontal: false, vertical: true)
                                            Text("\(infoYear ?? "2018") • \(Image(systemName: "person.2.fill")) \(infoPlayers ?? "2-4") • \(Image(systemName: "clock.fill")) \(infoTime ?? "60-90")")
                                                .font(.custom("Avenir", size: geoH / 16))
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                        }
                                        .padding(.vertical)
                                    }.padding(.horizontal)
                                }
                            if (showForSale){
                                Group {
                                    LinearGradient(colors: [Color("AccentColorTop"), Color("AccentColorBottom")], startPoint: .topLeading, endPoint: .bottomTrailing)
                                        .mask {
                                            Text("$")
                                                .font(.custom("Avenir-Black", size: geoW / 8))
                                        }.frame(width: geoW / 5, height: geoH / 3)
                                }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                            }// End of GeometryReader
                        }.cornerRadius(20)
                    }
                })
                .frame(maxWidth: .infinity)
                .aspectRatio(1.25, contentMode: .fit)
                .foregroundColor(Color.white)
        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

struct CustomCards_Previews: PreviewProvider {
    static var image = "https://d2k4q26owzy373.cloudfront.net/350x350/games/uploaded/1629324760985.jpg"
    
    static var previews: some View {
        CustomCards(roundedCorners: 60, gameName: "Root", imageUrl: image, rankNumber: "#1", heartNumber: "3201", watchlistNumber: "3201", showForSale: true)
    }
}
