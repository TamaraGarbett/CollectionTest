//
//  ImagesCollectionViewCell.swift
//  CollectionTest
//
//  Created by Admin on 2/9/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit


class ImagesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imagePreview: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(image: Photo){
        let url = URL(string: image.url)
        self.imagePreview.kf.setImage(with: url)
    }

}
