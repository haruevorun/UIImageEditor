//
//  CollectionViewCell.swift
//  PreViewEditor
//
//  Created by haruta yamada on 2018/10/03.
//  Copyright © 2018 terany. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    fileprivate let placeholder: UIImage = #imageLiteral(resourceName: "画像1.png")
    internal var image: UIImage? {
        didSet{
            imageView.image = self.image
            imageView.frame = self.contentView.frame
        }
    }
    private lazy var imageView: UIImageView = UIImageView(image: self.placeholder)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
