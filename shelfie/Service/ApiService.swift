//
//  ApiService.swift
//  shelfie
//
//  Created by Ramy Anber on 2022-04-10.
//

import Alamofire
import SwiftyJSON
import SwiftUI

class ApiService: ObservableObject {
    
    @Published var games = Games()
    let api_key = "&client_id=9E63bBvqoR"
    let url_search = "https://api.boardgameatlas.com/api/search?limit=100"
    let search_by_name = "&fuzzy_match=true&name="
    let search_top100 = "&order_by=rank"
    let url_by_id = "https://api.boardgameatlas.com/api/search?ids="
    let url_video = "https://api.boardgameatlas.com/api/game/videos?pretty=true&game_id="
    
    func getAllBoardgames(handler: @escaping (Games)->Void){
        let urlString = url_search + search_top100 + api_key
        AF.request(urlString, method: .get).responseData { [self] response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                games.allGames = json
                handler(games)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getBoardgamesByName(name:String, handler: @escaping (Games)->Void){
        let urlString = url_search + search_by_name + name + api_key
        AF.request(urlString, method: .get).responseData { [self] response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                games.gameByName = json
                handler(games)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getBoardgamesById(id:String, handler: @escaping (Games)->Void){
        let urlString = url_by_id + id + api_key
        AF.request(urlString, method: .get).responseData { [self] response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                games.gameById = json
                handler(games)
            case .failure(let error):
                print(error)
            }
        }
    }
}
