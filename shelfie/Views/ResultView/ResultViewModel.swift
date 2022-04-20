//
//  ResultViewModel.swift
//  shelfie
//
//  Created by Ramy Anber on 2022-04-20.
//

import Foundation
import SwiftUI

class ResultViewModel: ObservableObject {
    @Published var items = [TextItem]()
    
    func getSearchedGames(){
        for item in items {
            print(item.text)
        }
       
    }
}
