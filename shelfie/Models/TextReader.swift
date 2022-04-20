//
//  TextReader.swift
//  shelfie
//
//  Created by Luiz Fernando Reis on 2022-04-20.
//

import Foundation

class TextItem: Identifiable {
    var id: String
    var text: String = ""
    
    init() {
        id = UUID().uuidString
    }
}

class RecognizedContent: ObservableObject {
    @Published var items = [TextItem]()
}
