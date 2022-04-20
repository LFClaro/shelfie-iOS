//
//  ResultView.swift
//  shelfie
//
//  Created by Luiz Fernando Reis on 2022-04-20.
//

import SwiftUI

struct ResultView: View {
    var body: some View {
        ZStack{
            Image("bg").resizable().edgesIgnoringSafeArea(.all)
            Text("Games detected in your SHELFIE!")
                .font(.custom("Avenir-Black", size: sf.h * 0.04))
                .multilineTextAlignment(.leading)
        }
        .foregroundColor(.white)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
