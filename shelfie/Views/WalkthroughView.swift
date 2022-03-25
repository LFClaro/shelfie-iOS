//
//  WalkthroughView.swift
//  shelfie
//
//  Created by Luiz Fernando Reis on 2022-03-25.
//

import SwiftUI

struct WalkthroughView: View {
    var body: some View {
        ZStack{
            Image("bgWalkthrough").resizable().edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center){
                Image("launchShelfieWhite").resizable().scaledToFit()
                
                Rectangle()
                    .fill(Color("LinkBlue"))
                    .frame(width: sf.w * 0.3, height: 5)
                    .clipShape(RoundedRectangle(cornerRadius: 10))

                Text("From your photo to our Virtual Shelf!")
                    .font(.custom("Avenir-Black", size: sf.h * 0.04))
                    .multilineTextAlignment(.center)
                Text("Take a photo of your Board Game shelf - or, better yet, a SHELFIE - to instantly create your virtual collection!")
                    .font(.custom("Avenir", size: sf.h * 0.02))
                    .padding()
                
                NavigationLink {
                    LoginView()
                } label: {
                    Image("getStartedButton")
                }
                
            }.padding()
        }
        .foregroundColor(.white)
    }
}

struct WalkthroughView_Previews: PreviewProvider {
    static var previews: some View {
        WalkthroughView()
    }
}
