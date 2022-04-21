//
//  ResultViewModel.swift
//  shelfie
//
//  Created by Ramy Anber on 2022-04-20.
//

import Foundation
import SwiftUI
import SwiftyJSON

class ResultViewModel: ObservableObject {
    @Published var items = [TextItem]()
    @Published var filters: [String: JSON] = [:]
    
    func getSearchedGames(games : [String: JSON]){
        for item in items {
            filters = filterItems(item: item.text, games: games)
            print(filters)
        }
    }
    
    func filterItems(item: String, games: [String: JSON])-> [String: JSON]{
        let filterd = games.filter { (key, value) in
            return value["name"].stringValue.elementsEqual(item)
        }
        return filterd
    }
}
