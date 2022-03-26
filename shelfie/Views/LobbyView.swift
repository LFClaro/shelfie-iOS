//
//  LobbyView.swift
//  shelfie
//
//  Created by Ramy Anber on 2022-03-25.
//

import SwiftUI

struct LobbyView: View {
    @State var searchText = ""
    
    var body: some View {
        ZStack{
            Image("bg")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Image("logoShelfieWhite")
                            .resizable()
                            .scaledToFit()
                            .frame(width: sf.w * 0.5)
                    ProfileView(imageUrl: "")
                }.frame(width: sf.w * 0.96, height: sf.h * 0.08, alignment: .center)
                Text("Build your collection in a snap!")
                    .font(.custom("Avenir-Black", size: sf.h * 0.04))
                    .foregroundColor(.white)
                    .frame(width: sf.w * 0.95, height: sf.h * 0.2, alignment: .topLeading)
                CustomTextField(placeHolder: "Search", value: $searchText, roundedCorners: 10, textColor: .white, shadowRadius: 10, fontSize: sf.h * 0.04, bgColor: Color("bgSearchTxtField"), padding: sf.h * 0.02)
                    .frame(width: sf.w * 0.8, height: sf.h * 0.1, alignment: .center)
                Text("Browse Categories")
                    .font(.custom("Avenir-Black", size: sf.h * 0.04))
                    .foregroundColor(.white)
                    .frame(width: sf.w * 0.95, alignment: .leading)
                
                
            }
        }
    }
    
    
}

struct LobbyView_Previews: PreviewProvider {
    static var previews: some View {
        LobbyView()
    }
}
