//
//  ImageDishStaticCell.swift
//  GoodFood
//
//  Created by Егор Шкарин on 26.08.2021.
//

import UIKit

class ImageDishStaticCell: UITableViewCell {

    @IBOutlet weak var dishImage: UIImageView!
    static let reuseId = "ImageDishStaticCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(image: UIImage?) {
        guard let image = image else {
            return
        }
        self.dishImage.contentMode = .scaleAspectFill
        self.dishImage.image = image
    }
    
}
