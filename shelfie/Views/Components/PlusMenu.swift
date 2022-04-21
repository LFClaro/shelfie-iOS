//
//  PlusMenu.swift
//  shelfie
//
//  Created by Ramy Anber on 2022-04-20.
//

import SwiftUI

struct PlusMenu: View {
    //Camera Logic
    @State var showScanner: Bool = false
    @State var isRecognizing: Bool = false
    @EnvironmentObject var resultViewModel: ResultViewModel
    @State var isSuccess = false
    let widthAndHeight: CGFloat
    
    var body: some View {
        HStack(spacing: 50) {
            ZStack {
                Circle()
                    .fill(AngularGradient(colors: [Color("BtnPurple"), Color("bgButton")], center: .bottom))
                    .frame(width: widthAndHeight, height: widthAndHeight)
                Button {
                    showScanner.toggle()
                } label: {
                    Image(systemName: "camera.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(15)
                        .frame(width: widthAndHeight, height: widthAndHeight)
                }
                .sheet(isPresented: $showScanner, content: {
                    ScannerManager { result in
                        switch result {
                        case .success(let scannedImages):
                            isRecognizing = true
                            TextRecognition(scannedImages: scannedImages, resultViewModel: resultViewModel) {
                                isRecognizing = false
                            }.recognizeText()
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                        isSuccess = true
                        showScanner = false
                    } didCancelScanning: {
                        // Dismiss the scanner controller and the sheet.
                        showScanner = false
                    }
                })
                .fullScreenCover(isPresented: $isSuccess) {
                    ResultView()
                }

            }
            ZStack {
                Circle()
                    .fill(AngularGradient(colors: [Color("BtnPurple"), Color("bgButton")], center: .bottom))
                    .frame(width: widthAndHeight, height: widthAndHeight)
                Image(systemName: "folder.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: widthAndHeight, height: widthAndHeight)
            }
        }
        .transition(.scale)
    }
}


struct PlusMenu_Previews: PreviewProvider {
    static var previews: some View {
        PlusMenu(widthAndHeight: 20).environmentObject(ResultViewModel())
    }
}
