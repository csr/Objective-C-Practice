//
//  SavedGifsVewController.swift
//  GifMaker_Swift_Template
//
//  Created by Cesare de Cal on 3/17/19.
//  Copyright © 2019 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class SavedGifsVewController: UIViewController {

    var savedGifs = [Gif]()
    let cellMargin: CGFloat = 12
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var emptyView: UIStackView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emptyView.isHidden = savedGifs.isEmpty
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension SavedGifsVewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GifCell", for: indexPath) as? GifCell else { return UICollectionViewCell() }
//        let savedGif = savedGifs[indexPath.item]
//        cell.configure(for: savedGif)
        cell.gifImageView.backgroundColor = .blue
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SavedGifsVewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - cellMargin*2) / 2
        return CGSize(width: width, height: width)
    }
}
