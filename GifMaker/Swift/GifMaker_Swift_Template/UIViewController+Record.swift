//
//  UIViewController+Record.swift
//  GifMaker_Swift_Template
//
//  Created by Cesare de Cal on 3/3/19.
//  Copyright © 2019 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit
import MobileCoreServices

// Regift constants
let frameCount = 16
let delayTime: Float = 0.2
let loopCount = 0 // 0 means loop forever

// MARK: - UIViewController: UIImagePickerControllerDelegate

extension UIViewController: UIImagePickerControllerDelegate {
    
    @IBAction func launchVideoCamera(sender: AnyObject) {
        let recordViewController = pickerController(sourceType: .camera)
        present(recordViewController, animated: true, completion: nil)
    }
    
    func pickerController(sourceType: UIImagePickerControllerSourceType) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.mediaTypes = [kUTTypeMovie as String]
        picker.allowsEditing = true
        picker.delegate = self
        return picker
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let mediaType = info[UIImagePickerControllerMediaType] as? String, mediaType == kUTTypeMovie as String, let videoURL = info[UIImagePickerControllerMediaURL] as? URL {
            convertVideoToGIF(videoURL: videoURL)
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    // GIF conversion methods
    func convertVideoToGIF(videoURL: URL) {
        let regift = Regift(sourceFileURL: videoURL, frameCount: frameCount, delayTime: delayTime, loopCount: loopCount)
        if let gifURL = regift.createGif() {
            let gif = Gif(url: gifURL, videoURL: videoURL, caption: "")
            displayGIF(gif: gif)
        }
    }
    
    func displayGIF(gif: Gif) {
        guard let gifEditorVC = storyboard?.instantiateViewController(withIdentifier: "GifEditorViewController") as? GifEditorViewController else { return }
        gifEditorVC.gif = gif
        navigationController?.pushViewController(gifEditorVC, animated: true)
    }
}

// MARK: - UIViewController: UINavigationControllerDelegate

extension UIViewController: UINavigationControllerDelegate {}
