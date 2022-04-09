//
//  Routing.swift
//  shelfie
//
//  Created by Ramy Anber on 2022-03-25.
//

import Foundation
import SwiftUI

class Routing: ObservableObject {
    @Published var nextView: String?
    
    init(firstView: String) {
        nextView = firstView
    }
    
    func routeLogin() {
        nextView = "LoginView"
    }
    func routeLobby() {
        nextView = "LobbyView"
    }
    func routeProfile() {
        nextView = "ProfileView"
    }
    func routeSetting() {
        nextView = "SettingView"
    }
}


