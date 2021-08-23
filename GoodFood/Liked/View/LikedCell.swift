//
//  LikedCell.swift
//  GoodFood
//
//  Created by Егор Шкарин on 23.08.2021.
//

import UIKit

class LikedCell: UITableViewCell {
    @IBOutlet weak var likedImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    static let reuseId = "LikedCell"

    func configure(likedModel: LikedModel) {
        self.nameLabel.text = likedModel.name
        self.timeLabel.text = "\(likedModel.time ?? "0") мин."
        self.difficultyLabel.text = "Сложность: \(likedModel.difficualty ?? "0")/10"
        self.ratingLabel.text = "\(likedModel.rating ?? "0")/5"
        //TODO: Сделать через тип data
        self.likedImageView.image = UIImage(named: likedModel.image ?? "photo.fill")
        
        //Настройки ячейки
        self.likedImageView.contentMode = .scaleAspectFill
        self.likedImageView?.clipsToBounds = true
        self.likedImageView.layer.cornerRadius = likedImageView.frame.width / 2
        
        self.nameLabel.font.withSize(CGFloat(25))
        self.timeLabel.font.withSize(CGFloat(15))
        self.difficultyLabel.font.withSize(CGFloat(15))
    }
}
