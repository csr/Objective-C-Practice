//
//  WelcomeViewController.swift
//  GifMaker_Swift_Template
//
//  Created by Cesare de Cal on 3/3/19.
//  Copyright © 2019 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var gifImageView: UIImageView!
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let proofOfConceptGif = UIImage.gif(name: "hotlineBling")
        gifImageView.image = proofOfConceptGif
    }
}
