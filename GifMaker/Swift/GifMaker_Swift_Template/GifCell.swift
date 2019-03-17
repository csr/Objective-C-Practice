//
//  GifCell.swift
//  GifMaker_Swift_Template
//
//  Created by Cesare de Cal on 3/17/19.
//  Copyright © 2019 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class GifCell: UICollectionViewCell {
    
    @IBOutlet weak var gifImageView: UIImageView!
    
    func configure(for gif: Gif) {
        gifImageView.image = gif.gifImage
    }
}
