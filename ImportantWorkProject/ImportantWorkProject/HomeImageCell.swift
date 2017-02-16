//
//  HomeImageCell.swift
//  ImportantWorkProject
//
//  Created by Steven Thompson on 2017-02-15.
//  Copyright © 2017 stevethomp. All rights reserved.
//

import UIKit

class HomeImageCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()

        backgroundColor = .lightGray
        layer.cornerRadius = 3.0
    }

    func configure(with image: UIImage) {
        imageView.image = image
        
        imageView.backgroundColor = .blue
    }
}
