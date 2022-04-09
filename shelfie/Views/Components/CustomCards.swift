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
                                    .resizable()
                                    .frame(width: sf.w * 0.8, height: sf.h * 0.17)
                                Text(rankNumber ?? "#1")
                                    .bold()
                                    .frame(width: sf.w * 0.1, height: sf.h * 0.02, alignment: .center)
                                    .padding(3)
                                    .foregroundColor(.white)
                                    .background(Color("green"))
                                    .cornerRadius(20)
                                    .position(x: sf.w * 0.15, y: sf.h * 0.15)
                                HStack{
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.white)
                                    Text(heartNumber ?? "3254")
                                        .bold()
                                        .foregroundColor(Color.white)
                                        .font(.system(size: sf.w * 0.03))
                                        .frame(width: sf.w * 0.1, height: sf.h * 0.02, alignment: .center)
                                }
                                .padding(3)
                                .background(Color("red"))
                                .cornerRadius(20)
                                .position(x: sf.w * 0.15, y: sf.h * 0.03)
                                HStack{
                                    Image("eyes")
                                        .foregroundColor(.white)
                                    Text(viewsNumber ?? "3254")
                                        .bold()
                                        .foregroundColor(Color.white)
                                        .font(.system(size: sf.w * 0.03))
                                        .frame(width: sf.w * 0.1, height: sf.h * 0.02, alignment: .center)
                                }
                                .padding(3)
                                .background(Color("babyBlue"))
                                .cornerRadius(20)
                                .position(x: sf.w * 0.65, y: sf.h * 0.03)
                                  
                            }.frame(width: sf.w * 0.78, height: sf.h * 0.18, alignment: .center)
                            HStack{
                                Text(cardName ?? "Root")
                                    .bold()
                                    .foregroundColor(Color.white)
                                Image("$")
                                    .frame(maxWidth: .infinity, alignment: .topTrailing)
                            }.frame(width: sf.w * 0.7, height: sf.h * 0.03, alignment: .center)
                            Text(description ?? "dsadasasd")
                                .font(.system(size: sf.w * 0.035))
                                .foregroundColor(Color.white)
                                .frame(width: sf.w * 0.7, height: sf.h * 0.03, alignment: .topLeading)
                        }
                    }.cornerRadius(10)
                })
                .frame(width: sf.w * 0.8, height: sf.h * 0.26)
        }
    }
}

struct CustomCards_Previews: PreviewProvider {
    static var previews: some View {
        CustomCards(roundedCorners: 20, cardName: "Root", image: "gameImageTest", width: sf.w * 0.5, height: sf.h * 0.22, description: "2018  •  2-4 Players  • 60-90 Mins", rankNumber: "#1", heartNumber: "3201", viewsNumber: "3201")
    }
}
