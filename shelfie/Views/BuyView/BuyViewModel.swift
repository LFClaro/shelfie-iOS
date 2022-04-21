//
//  BuyViewModel.swift
//  shelfie
//
//  Created by Luiz Fernando Reis on 2022-04-21.
//

import Foundation
import SwiftyJSON

class BuyViewModel: ObservableObject {
    
    @Published var games = Games()
    static var shared = BuyViewModel()

    func getGamePricesById(boardgameId: String){
        games.gameVideos = [:]
        ApiService.shared.getGamePricesById(id: boardgameId) { [self] gamePrices in
            gamePrices["gameWithPrices"]["canada"].forEach{(s , j) in // Just for Canada at first
                games.gamePrices?[s] = j
            }
        }
    }
}
