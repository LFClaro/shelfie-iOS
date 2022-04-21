//
//  ApiService.swift
//  shelfie
//
//  Created by Ramy Anber on 2022-04-10.
//

import Alamofire
import SwiftyJSON
import SwiftUI

class ApiService {
    
    let api_key = "&client_id=9E63bBvqoR"
    let url_search = "https://api.boardgameatlas.com/api/search?limit=100"
    let search_by_name = "&fuzzy_match=true&name="
    let search_top100 = "&order_by=rank"
    let search_by_category = "&categories="
    let url_by_id = "https://api.boardgameatlas.com/api/search?ids="
    let url_videos = "https://api.boardgameatlas.com/api/game/videos?pretty=true&game_id="
    let url_images = "https://api.boardgameatlas.com/api/game/images?pretty=true&game_id="
    let url_prices = "https://api.boardgameatlas.com/api/game/prices?pretty=true&game_id="
    static let shared = ApiService()
    
    
    func getAllBoardgames(handler: @escaping (JSON)->Void){
        let urlString = url_search + search_top100 + api_key
        AF.request(urlString, method: .get).responseData { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                handler(json)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getAllBoardgamesByCategory(category: String, handler: @escaping (JSON)->Void){
        let urlString = url_search + search_top100 + api_key + search_by_category + category
        AF.request(urlString, method: .get).responseData { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                handler(json)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getBoardgamesByName(name:String, handler: @escaping (JSON)->Void){
        let urlString = url_search + search_by_name + name + api_key
        AF.request(urlString, method: .get).responseData { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                handler(json)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getBoardgamesById(id:String, handler: @escaping (JSON)->Void){
        let urlString = url_by_id + id + api_key
        AF.request(urlString, method: .get).responseData { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                handler(json)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getGameImagesById(id:String, handler: @escaping (JSON)->Void){
        let urlString = url_images + id + api_key
        AF.request(urlString, method: .get).responseData { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                handler(json)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getGameVideosById(id:String, handler: @escaping (JSON)->Void){
        let urlString = url_videos + id + api_key
        AF.request(urlString, method: .get).responseData { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                handler(json)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getGamePricesById(id:String, handler: @escaping (JSON)->Void){
        let urlString = url_prices + id + api_key
        AF.request(urlString, method: .get).responseData { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                handler(json)
            case .failure(let error):
                print(error)
            }
        }
    }
}
