//
//  SearchhCell.swift
//  GoodFood
//
//  Created by Егор Шкарин on 14.08.2021.
//

import UIKit
import Cosmos
class SearchCell: UITableViewCell {
    @IBOutlet weak var imageOfDish: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var difficulty: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var rating: CosmosView!
    
    static let reuseId = "SearchCell"
    static let nibName = "SearchCell"
    func configure(menuPoint: MenuPoint) {
        self.name.text = menuPoint.name
        self.time.text = "\(menuPoint.time ?? "0") мин."
        self.difficulty.text = "Сложность: \(menuPoint.difficualty ?? "0")/10"
        self.rating.rating = Double(menuPoint.rating ?? "0") ?? 0
        //TODO: Сделать через тип data
        self.imageOfDish.image = UIImage(named: menuPoint.image ?? "photo.fill")
        
        //Настройки ячейки
        self.imageOfDish.contentMode = .scaleAspectFill
        self.imageOfDish?.clipsToBounds = true
        self.backgroundColor = .tertiarySystemBackground
        self.imageOfDish.layer.cornerRadius = imageOfDish.frame.width / 2
    }
}
