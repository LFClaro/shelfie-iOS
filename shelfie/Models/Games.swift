//
//  Games.swift
//  shelfie
//
//  Created by Ramy Anber on 2022-04-10.
//

import Foundation
import SwiftyJSON

struct Games : Identifiable {
    var id = UUID()
    
    var topGames: [String: JSON]?
    var gameByName: JSON?
    var gameById: JSON?
    var gameImages: [String: JSON]?
    var gameVideos: [String: JSON]?
    var gamePrices: [String: JSON]?
}
