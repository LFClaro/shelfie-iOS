//
//  ViewRouter.swift
//  shelfie
//
//  Created by Luiz Fernando Reis on 2022-03-25.
//

import SwiftUI

class ViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .home
    
}

enum Page {
    case home
    case collection
    case watchlist
    case settings
}
