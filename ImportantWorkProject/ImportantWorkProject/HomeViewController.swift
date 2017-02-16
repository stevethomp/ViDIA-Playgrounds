//
//  HomeViewController.swift
//  ImportantWorkProject
//
//  Created by Steven Thompson on 2017-02-15.
//  Copyright © 2017 stevethomp. All rights reserved.
//

import UIKit
import airGiOSTools

class HomeViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(HomeImageCell.self)
    }
}

private typealias CollectionViewDataSource = HomeViewController
extension CollectionViewDataSource: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 151
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: HomeImageCell = collectionView.dequeueCell(forIndexPath: indexPath)
        let name = "\(indexPath.row + 1)"
        
        if let image = UIImage(named: name) {
            cell.configure(with: image)
        }
        return cell
    }
}

private typealias FlowLayoutDelegate = HomeViewController
extension FlowLayoutDelegate: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 20) / 3
        return CGSize(width: width, height: width)
    }
}
