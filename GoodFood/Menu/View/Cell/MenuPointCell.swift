//
//  MenuPointCell.swift
//  GoodFood
//
//  Created by Егор Шкарин on 12.08.2021.
//

import UIKit

class MenuPointCell: UICollectionViewCell {
    static let nibName = "MenuPointCell"
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var difficulty: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(menuPoint: MenuPoint) {
        self.name.text = menuPoint.name
        self.time.text = menuPoint.time ?? "0" + " мин."
        self.difficulty.text = "Сложность: \(menuPoint.difficualty ?? "0")/10"
        self.rating.text = menuPoint.rating ?? "0" + "/5"
        //TODO: Сделать через тип data
        self.image.image = UIImage(named: menuPoint.image ?? "")
        self.image.contentMode = .scaleAspectFill
        
        //Внешний вид ячейки
        
        self.image.layer.cornerRadius = image.frame.height / 2
        
        self.name.font.withSize(CGFloat(20))
        self.time.font.withSize(CGFloat(15))
        self.difficulty.font.withSize(CGFloat(15))
        self.layer.addBorder(edge: .bottom, color: #colorLiteral(red: 0.7620784104, green: 0.7620784104, blue: 0.7620784104, alpha: 1), thickness: 0.5)

    }
}
