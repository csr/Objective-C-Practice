//
//  Gif.swift
//  GifMaker_Swift_Template
//
//  Created by Cesare de Cal on 3/3/19.
//  Copyright © 2019 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class Gif {
    var url: URL?
    var videoURL: URL?
    var caption: String?
    var gifImage: UIImage?
    var gifData: NSData?
    
    init(url: URL, videoURL: URL, caption: String) {
        self.url = videoURL
        self.videoURL = videoURL
        self.caption = caption
        self.gifImage = UIImage.gif(url: url.absoluteString)
        self.gifData = nil
    }
    
    init(name: String) {
        self.gifImage = UIImage.gif(name: name)
    }
}
