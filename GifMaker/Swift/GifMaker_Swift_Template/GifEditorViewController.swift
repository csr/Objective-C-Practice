//
//  GifEditorViewController.swift
//  GifMaker_Swift_Template
//
//  Created by Cesare de Cal on 3/3/19.
//  Copyright © 2019 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class GifEditorViewController: UIViewController {

    @IBOutlet weak var gifImageView: UIImageView!
    @IBOutlet weak var captionTextField: UITextField!
    
    var gif: Gif?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add a Caption"
        captionTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        gifImageView.backgroundColor = .yellow
        
        if let gif = gif {
            gifImageView.image = gif.gifImage
        }
        
        subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }
    
    @IBAction func presentPreview(sender: AnyObject) {
        guard let videoURL = self.gif?.videoURL, let previewVC = self.storyboard?.instantiateViewController(withIdentifier: "GifPreviewViewController") as? GifPreviewViewController, let captionText = captionTextField.text else { return }
        self.gif?.caption = self.captionTextField.text
        
        let regift = Regift(sourceFileURL: videoURL, destinationFileURL: nil, frameCount: frameCount, delayTime: delayTime, loopCount: loopCount)
        let captionFont = self.captionTextField.font
        if let gifURL = regift.createGif(self.captionTextField.text, font: captionFont) {
            let newGif = Gif(url: gifURL, videoURL: videoURL, caption: captionText)
            previewVC.gif = newGif
            self.navigationController?.pushViewController(previewVC, animated: true)
        }
    }
    
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
}

extension GifEditorViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.placeholder = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if self.view.frame.origin.y >= 0 {
            var rect = self.view.frame
            rect.origin.y -= self.getKeyboardHeight(notification: notification)
            self.view.frame = rect
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y < 0 {
            var rect = self.view.frame
            rect.origin.y += self.getKeyboardHeight(notification: notification)
            self.view.frame = rect
        }
    }

    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        if let userInfo = notification.userInfo, let keyboardSize = userInfo[UIKeyboardFrameBeginUserInfoKey] as? CGRect {
            return keyboardSize.height
        } else {
            return 0
        }
    }
}
