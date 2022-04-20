//
//  ScannerManager.swift
//  shelfie
//
//  Created by Luiz Fernando Reis on 2022-04-20.
//

import SwiftUI
import VisionKit

struct ScannerManager: UIViewControllerRepresentable {
    var didFinishScanning: ((_ result: Result<[UIImage], Error>) -> Void)
    var didCancelScanning: () -> Void
    
    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let scannerViewController = VNDocumentCameraViewController()
        
        // Set delegate here.
        scannerViewController.delegate = context.coordinator
        
        return scannerViewController
    }
    
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) { }
    
    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        let scannerManager: ScannerManager
        
        init(with scannerView: ScannerManager) {
            self.scannerManager = scannerView
        }
        
        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            scannerManager.didCancelScanning()
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
            scannerManager.didFinishScanning(.failure(error))
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            var scannedPages = [UIImage]()
            
            for i in 0..<scan.pageCount {
                scannedPages.append(scan.imageOfPage(at: i))
            }
            
            scannerManager.didFinishScanning(.success(scannedPages))
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(with: self)
    }
}
