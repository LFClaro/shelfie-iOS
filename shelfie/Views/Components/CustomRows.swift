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
    var scale: CGFloat?
    var infoYear: String?
    var infoPlayers: String?
    var infoTime: String?
    var rankNumber: String?
    var isInCollection = false
    var isWatchlisted = false
    var showHeart = true
    var showEyes = true
    var showForSale = true
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: roundedCorners ?? 20)
                .overlay(content: {
                    ZStack{
                        Color("DarkPurple")
                        HStack (spacing:0) {
//                            if (rankNumber != nil) {
//                                Text(rankNumber ?? "1")
//                                    .font(.custom("Avenir-Black", size: sf.h * 0.02))
//                                    .frame(width: sf.w * 0.2, height: sf.h * 0.04, alignment: .center)
//                                    .padding(3)
//                                    .background(Color("green"))
//                                    .cornerRadius(20)
//                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
//                                    .padding()
//                            }
                            Group {
                                if imageUrl != nil {
                                    AsyncImage(url: URL(string: imageUrl ?? "")) { image in
                                        image.resizable().scaledToFill()
                                    } placeholder: {
                                        ProgressView()
                                            .scaleEffect(0.5)
                                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    }
                                } else {
                                    Image("bgPattern")
                                        .resizable()
                                        .scaledToFill()
                                }
                            }
                            .frame(width: sf.w * 0.15, height: sf.h * 0.065)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            HStack(spacing:0){
                                VStack (spacing:0){
                                    Text(cardName ?? "Catan")
                                        .font(.custom("Avenir-Black", size: sf.h * 0.02))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    if (!showEyes && !showHeart && !showForSale){
                                        Text("\(infoYear ?? "2010") | \(Image(systemName: "person.2.fill")) \(infoPlayers ?? "2-4") | \(Image(systemName: "clock.fill")) \(infoTime ?? "60-90")")
                                            .font(.custom("Avenir", size: sf.h * 0.015))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    } else {
                                        Text("\(Image(systemName: "person.2.fill")) \(infoPlayers ?? "2-4") | \(Image(systemName: "clock.fill")) \(infoTime ?? "60-90")")
                                            .font(.custom("Avenir", size: sf.h * 0.015))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                }
                                .padding(.vertical, 8)
                                Spacer()
                                if (showHeart) {
                                    Image(systemName: "heart.fill")
                                        .font(.custom("Avenir-Black", size: sf.h * 0.02))
                                        .foregroundColor(isInCollection ? Color("red") : .white)
                                        .frame(width: sf.w * 0.1)
                                }
                                Spacer()
                                if (showEyes) {
                                    Image(systemName: "eyes.inverse")
                                        .font(.custom("Avenir-Black", size: sf.h * 0.02))
                                        .foregroundColor(isWatchlisted ? Color("babyBlue") : .white)
                                        .frame(width: sf.w * 0.1)
                                }
                                Spacer()
                                if (showForSale){
                                    LinearGradient(colors: [Color("AccentColorTop"), Color("AccentColorBottom")], startPoint: .topLeading, endPoint: .bottomTrailing)
                                        .mask {
                                            Text("$")
                                                .font(.custom("Avenir-Black", size: sf.h * 0.03))
                                        }.frame(maxWidth: sf.w * 0.1, maxHeight: sf.h * 0.03)
                                }
                            }.padding(.horizontal)
                        }
                    }.cornerRadius(20)
                })
                .frame(maxWidth: width ?? .infinity)
                .aspectRatio(8, contentMode: .fit)
                .scaleEffect(scale ?? 1)
                .foregroundColor(Color.white)
        }
    }
}

struct CustomRows_Previews: PreviewProvider {
    static var image = "https://d2k4q26owzy373.cloudfront.net/350x350/games/uploaded/1629324722072.jpg"
    
    static var previews: some View {
        CustomRows(roundedCorners: 60, cardName: "Catan", imageUrl: image, scale: 1, infoPlayers: "2-4", infoTime: "60-90", rankNumber: "#1")
    }
}
