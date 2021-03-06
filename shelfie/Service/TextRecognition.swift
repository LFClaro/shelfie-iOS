//
//  TextRecognition.swift
//  shelfie
//
//  Created by Luiz Fernando Reis on 2022-04-20.
//

import SwiftUI
import Vision

struct TextRecognition {
    var scannedImages: [UIImage]
    @ObservedObject var resultViewModel: ResultViewModel
    
    var didFinishRecognition: () -> Void
    
    private func getTextRecognitionRequest(with textItem: TextItem, currentImageIndex: Int) -> VNRecognizeTextRequest {
        let request = VNRecognizeTextRequest { request, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
     
            guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
     
            observations.forEach { observation in
                guard let recognizedText = observation.topCandidates(1).first else { return }
                textItem.text += recognizedText.string
                textItem.text += "\n"
            }
        }
     
        request.recognitionLevel = .accurate
        request.usesLanguageCorrection = true
     
        return request
    }
    
    func recognizeText() {
        let queue = DispatchQueue(label: "textRecognitionQueue", qos: .userInitiated)
        queue.async {
            for image in scannedImages {
                guard let cgImage = image.cgImage else { return }
     
                let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
                do {
                    let textItem = TextItem()
                    try requestHandler.perform([getTextRecognitionRequest(with: textItem, currentImageIndex: 0)])
     
                        DispatchQueue.main.async {
                            resultViewModel.items.append(textItem)
                        }
     
                } catch {
                    print(error.localizedDescription)
                }
            }
     
            DispatchQueue.main.async {
                didFinishRecognition()
            }
        }
    }
    
}
