//
//  GameViewModel.swift
//  shelfie
//
//  Created by Luiz Fernando Reis on 2022-04-21.
//

import Foundation
import SwiftyJSON

class GameViewModel: ObservableObject {
    
    @Published var games = Games()
    static var shared = GameViewModel()
    
    func getGameById(boardgameId: String){
        ApiService.shared.getBoardgamesById(id: boardgameId) { gameJSON in
            self.games.gameById = gameJSON
        }
    }
}
