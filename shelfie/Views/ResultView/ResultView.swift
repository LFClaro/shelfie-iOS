//
//  ResultView.swift
//  shelfie
//
//  Created by Luiz Fernando Reis on 2022-04-20.
//

import SwiftUI

struct ResultView: View {
    @EnvironmentObject var model: ResultViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var didScreenLoad: Bool = false
    @State var rowImage = "https://d2k4q26owzy373.cloudfront.net/350x350/games/uploaded/1629324722072.jpg"

    
    var body: some View {
        ZStack{
            Image("bg").resizable().edgesIgnoringSafeArea(.all)
            VStack{
                Button(action: {self.presentationMode.wrappedValue.dismiss()}) {
                    Image(systemName: "chevron.backward")
                        .font(.largeTitle.bold())
                        .opacity(didScreenLoad ? 1 : 0)
                        .rotationEffect(.degrees(didScreenLoad ? 0 : -90))
                        .animation(.spring().delay(0.2), value: didScreenLoad)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.white)
                }
                Text("Games detected in your SHELFIE!")
                    .font(.custom("Avenir-Black", size: sf.w * 0.1))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.white)
                ButtonView(sf: sf, text: "Add All to Collection", fontSize: sf.w * 0.05, hTextPadding: sf.w * 0, color: LinearGradient(gradient: Gradient(colors: [Color("AccentColorBottom"), Color("AccentColorTop")]), startPoint: .top, endPoint: .bottom), height: sf.h * 0.08 , width: sf.w * 0.8) {
                    
                }
                HStack{
                    Text("Game not found? ")
                        .font(.custom("Avenir-Black", size: sf.w * 0.05))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                    Text("Search here")
                        .font(.custom("Avenir-Black", size: sf.w * 0.05))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                }
                ScrollView(.vertical){
                    CustomRows(roundedCorners: 60, gameName: "Catan", imageUrl: rowImage, infoPlayers: "2-4", infoTime: "60-90", showHeart: false, showEyes: false, showForSale: false)
                        ForEach(model.items, id: \.id) {textItem in
                            Text(textItem.text)
                        }
                }
            }
        }.onAppear {
            model.getSearchedGames()
            didScreenLoad.toggle()
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView().environmentObject(ResultViewModel())
    }
}
