//
//  HomeViewModel.swift
//  shelfie
//
//  Created by Ramy Anber on 2022-04-10.
//

import Foundation
import SwiftyJSON

class HomeViewModel: ObservableObject {
    
    @Published var games = Games()
    static var shared = HomeViewModel()
    
    func getTopGames(){
        games.topGames = [:]
        ApiService.shared.getAllBoardgames { [self] topGames in
            topGames["games"].forEach { (s , j) in
                games.topGames?[s] = j
            }
        }
    }
}

