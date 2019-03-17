//
//  UIViewController+Record.swift
//  GifMaker_Swift_Template
//
//  Created by Cesare de Cal on 3/3/19.
//  Copyright © 2019 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit
import MobileCoreServices
import AVFoundation

// Regift constants
let frameCount = 16
let delayTime: Float = 0.2
let loopCount = 0 // 0 means loop forever

// MARK: - UIViewController: UIImagePickerControllerDelegate

extension UIViewController: UIImagePickerControllerDelegate {
    
    @IBAction func presentVideoOptions(sender: AnyObject) {
        if !UIImagePickerController.isSourceTypeAvailable(.camera) {
            launchPhotoLibrary()
        } else {
            let newGifActionSheet = UIAlertController(title: "Create a new GIF", message: nil, preferredStyle: .actionSheet)
            let recordVideoAction = UIAlertAction(title: "Record a Video", style: .default) { (action) in
                self.launchVideoCamera()
            }
            let chooseFromExistingAction = UIAlertAction(title: "Choose from Existing", style: .default) { (action) in
                self.launchPhotoLibrary()
            }
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            newGifActionSheet.addAction(recordVideoAction)
            newGifActionSheet.addAction(chooseFromExistingAction)
            newGifActionSheet.addAction(cancelAction)
            
            present(newGifActionSheet, animated: true, completion: nil)
            let pinkColor = #colorLiteral(red: 1, green: 0.2549019608, blue: 0.4392156863, alpha: 1)
            newGifActionSheet.view.tintColor = pinkColor
        }
    }
    
    func launchVideoCamera() {
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
    
    func launchPhotoLibrary() {
        self.present(pickerController(sourceType: .photoLibrary), animated: true, completion: nil)
    }
}
    

// MARK: - UIViewController: UINavigationControllerDelegate

extension UIViewController: UINavigationControllerDelegate {}
