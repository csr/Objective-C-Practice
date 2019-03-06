//
//  PreviewViewController.swift
//  GifMaker_Swift_Template
//
//  Created by Cesare de Cal on 3/3/19.
//  Copyright © 2019 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class GifPreviewViewController: UIViewController {
    
    var gif: Gif?
    @IBOutlet weak var gifImageView: UIImageView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.gifImageView.image = self.gif?.gifImage
    }
    
    @IBAction func shareGif(sender: AnyObject) {
        guard let gifURL = self.gif?.url else {
            return
        }
        
        do {
            let animatedGif = try Data(contentsOf: gifURL)
            let itemsToShare = [animatedGif]
            let shareController = UIActivityViewController(activityItems: itemsToShare, applicationActivities: nil)
            self.present(shareController, animated: true, completion: nil)
        } catch {
            print("Error while sharing GIF")
        }
    }
}
