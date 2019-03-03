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
    
    var gifURL: URL?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        gifImageView.backgroundColor = .yellow
        
        if let gifURL = gifURL {
            print("the gif URL is \(gifURL)")
            let gifFromRecording = UIImage.gif(url: gifURL.absoluteString)
            gifImageView.image = gifFromRecording
        }
    }
}
