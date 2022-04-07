//
//  LaunchView.swift
//  shelfie
//
//  Created by Ramy Anber on 2022-03-25.
//

import SwiftUI

struct LaunchView: View {
    var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State private var counter: Int = 0
    @State private var loops: Int = 0
    @State private var textSizeChanged = false
    @Binding var showLaunch: Bool
    
    var body: some View {
        ZStack{
            Image("bgLaunch")
                .resizable().edgesIgnoringSafeArea(.all)
            Image("launchShelfieWhite")
                .resizable().scaledToFit()
            
        }.onReceive(timer , perform: { _ in
            textSizeChanged.toggle()
            withAnimation(.none){
                let lastIndex = 10
                if counter == lastIndex{
                    counter = 0
                    loops += 1
                    if loops >= 2 {
                        showLaunch = false
                    }
                }else{
                    counter += 1
                }
            }
        })
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(showLaunch: .constant(true))
    }
}

