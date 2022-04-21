//
//  shelfieApp.swift
//  shelfie
//
//  Created by Luiz Fernando Reis on 2022-03-25.
//

import SwiftUI
import Firebase

let sf = ScaleFactor()

@main
struct shelfieApp: App {
    
    @State private var showLaunchScreen: Bool = true
    @State var gameId = "TAAifFP590"
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ZStack{
                    GameView(gameId: $gameId).navigationBarHidden(true)
                    ZStack{
                        if showLaunchScreen{
                            LaunchView(showLaunch: $showLaunchScreen).transition(.move(edge: .leading))
                                .statusBar(hidden: true)
                        }
                    }.zIndex(2.0)
                }
            }
            .preferredColorScheme(.dark)
        }
    }
    init() {
        FirebaseApp.configure()
    }
}
