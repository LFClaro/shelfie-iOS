//
//  CustomRows.swift
//  shelfie
//
//  Created by Luiz Fernando Reis on 2022-04-09.
//

import SwiftUI

struct CustomRows: View {
    var roundedCorners: CGFloat?
    var startColor: Color?
    var endColor: Color?
    var cardName: String?
    var imageUrl: String?
    var width: CGFloat?
    var height: CGFloat?
    var infoYear: String?
    var infoPlayers: String?
    var infoTime: String?
    var rankNumber: String?
    var isInCollection = false
    var isWatchlisted = false
    var showHeart = true
    var showEyes = true
    var showForSale = true
    var showAddToCollection = false
    
    var body: some View {
        ZStack{
            GeometryReader {geo in
                let geoW = geo.size.width
                let geoH = geo.size.height
                HStack (spacing: 5){
                    if (rankNumber != nil) {
                        Text(rankNumber ?? "1")
                            .frame(width: geoW / 8, height: geoH, alignment: .center)
                            .font(.custom("Avenir-Black", size: geoH / 2))
                            .background(Color("green"))
                            .cornerRadius(10)
                    }
                    RoundedRectangle(cornerRadius: roundedCorners ?? 20)
                        .overlay(content: {
                            ZStack{
                                Color("DarkPurple")
                                HStack (spacing:0) {
                                    //
                                    Group {
                                        if imageUrl != nil {
                                            AsyncImage(url: URL(string: imageUrl ?? "")) { image in
                                                image.resizable().scaledToFill()
                                            } placeholder: {
                                                ProgressView()
                                            }
                                        } else {
                                            Image("bgPattern")
                                                .resizable()
                                                .scaledToFill()
                                        }
                                    }
                                    .frame(width: geoW / 6, height: geoH)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    HStack(spacing:0){
                                        VStack (spacing:0){
                                            Text(cardName ?? "Catan")
                                                .font(.custom("Avenir-Black", size: geoH / 3))
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            if (!showAddToCollection){
                                                if (showEyes || showHeart || showForSale){
                                                    Text("\(Image(systemName: "person.2.fill")) \(infoPlayers ?? "2-4") |  \(Image(systemName: "clock.fill")) \(infoTime ?? "60-90")")
                                                        .font(.custom("Avenir", size: geoH / 4))
                                                        .frame(maxWidth: .infinity, alignment: .leading)
                                                }
                                            } else {
                                                Text("\(infoYear ?? "2010") | \(Image(systemName: "person.2.fill")) \(infoPlayers ?? "2-4") |  \(Image(systemName: "clock.fill")) \(infoTime ?? "60-90")")
                                                    .font(.custom("Avenir", size: geoH / 4))
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                            }
                                        }
                                        Spacer()
                                        if (showAddToCollection) {
                                            Image(systemName: "plus")
                                                .font(.custom("Avenir-Black", size: geoH / 1.8))
                                                .foregroundColor(isInCollection ? Color("red") : .white)
                                                .frame(width: geoW / 5)
                                            Spacer()
                                        } else {
                                            if (showHeart) {
                                                Image(systemName: "heart.fill")
                                                    .font(.custom("Avenir-Black", size: geoH / 3))
                                                    .foregroundColor(isInCollection ? Color("red") : .white)
                                                    .frame(width: geoW / 10)
                                            }
                                            Spacer()
                                            if (showEyes) {
                                                Image(systemName: "eyes.inverse")
                                                    .font(.custom("Avenir-Black", size: geoH / 3))
                                                    .foregroundColor(isWatchlisted ? Color("babyBlue") : .white)
                                                    .frame(width: geoW / 10)
                                            }
                                            Spacer()
                                            if (showForSale){
                                                LinearGradient(colors: [Color("AccentColorTop"), Color("AccentColorBottom")], startPoint: .topLeading, endPoint: .bottomTrailing)
                                                    .mask {
                                                        Text("$")
                                                            .font(.custom("Avenir-Black", size: geoH / 2))
                                                    }.frame(maxWidth: geoW / 10, maxHeight: geoH / 2)
                                            }
                                        }
                                    }.padding(.horizontal)
                                }
                            }.cornerRadius(20)
                        })
                        .frame(maxWidth: .infinity)
                }
            }// End of GeometryReader
        }
        .frame(maxWidth: .infinity)
        .aspectRatio(8, contentMode: .fit)
        .foregroundColor(Color.white)
    }
}

struct CustomRows_Previews: PreviewProvider {
    static var image = "https://d2k4q26owzy373.cloudfront.net/350x350/games/uploaded/1629324722072.jpg"
    
    static var previews: some View {
        CustomRows(roundedCorners: 60, cardName: "Catan", imageUrl: image, infoPlayers: "2-4", infoTime: "60-90", rankNumber: "1")
    }
}
