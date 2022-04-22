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
        ApiService.shared.getBoardgamesById(id: boardgameId) { [self] gameJSON in
            games.gameById = gameJSON["games"][0]
        }
    }
    
    func getGameImagesById(boardgameId: String){
        games.gameImages = [:]
        ApiService.shared.getGameImagesById(id: boardgameId) { [self] gameImages in
            gameImages["images"].forEach{(s , j) in
                games.gameImages?[s] = j
            }
        }
    }
    
    func getGameVideosById(boardgameId: String){
        games.gameVideos = [:]
        ApiService.shared.getGameVideosById(id: boardgameId) { [self] gameVideos in
            gameVideos["videos"].forEach{(s , j) in
                games.gameVideos?[s] = j
            }
        }
    }
}
