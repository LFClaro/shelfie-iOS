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
    var cardName: String?
    var image: String?
    var width: CGFloat?
    var height: CGFloat?
    var description: String?
    var rankNumber: String?
    var heartNumber: String?
    var viewsNumber: String?
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: roundedCorners ?? 20)
                .overlay(content: {
                    ZStack{
                        Color("DarkPurple")
                        VStack{
                            ZStack{
                                Image(image ?? "gameImageTest")
                                    .frame(width: 265, height: 150)
                                Text(rankNumber ?? "#1")
                                    .bold()
                                    .frame(width: 50, height: 20, alignment: .center)
                                    .padding(3)
                                    .foregroundColor(.white)
                                    .background(Color("green"))
                                    .cornerRadius(20)
                                    .position(x: 32, y: 120)
                                HStack{
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.white)
                                    Text(heartNumber ?? "3254")
                                        .bold()
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 12))
                                        .frame(width: 40, height: 20, alignment: .center)
                                }
                                .padding(3)
                                .background(Color("red"))
                                .cornerRadius(20)
                                .position(x: 40, y: 40)
                                HStack{
                                    Image("eyes")
                                        .foregroundColor(.white)
                                    Text(viewsNumber ?? "3254")
                                        .bold()
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 12))
                                        .frame(width: 40, height: 20, alignment: .center)
                                }
                                .padding(3)
                                .background(Color("babyBlue"))
                                .cornerRadius(20)
                                .position(x: 220, y: 40)
                                  
                            }
                            HStack{
                                Text(cardName ?? "Root")
                                    .bold()
                                    .foregroundColor(Color.white)
                                Image("$")
                                    .frame(maxWidth: .infinity, alignment: .topTrailing)
                            }.frame(width: 250, height: 20, alignment: .topLeading)
                            Text(description ?? "dsadasasd")
                                .font(.system(size: 13))
                                .foregroundColor(Color.white)
                                .frame(width: 250, height: 20, alignment: .topLeading)
                        }
                    }.cornerRadius(10)
                })
                .frame(width: width ?? 0, height: height ?? 0)
        }
    }
}

struct CustomCards_Previews: PreviewProvider {
    static var previews: some View {
        CustomCards(roundedCorners: 20, cardName: "Root", image: "gameImageTest", width: sf.w * 0.5, height: sf.h * 0.22, description: "2018  •  2-4 Players  • 60-90 Mins", rankNumber: "#1", heartNumber: "3201", viewsNumber: "3201")
    }
}
