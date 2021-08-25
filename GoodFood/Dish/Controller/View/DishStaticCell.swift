//
//  DishStaticCell.swift
//  GoodFood
//
//  Created by Егор Шкарин on 25.08.2021.
//

import UIKit

class DishStaticCell: UITableViewCell {
    @IBOutlet weak var recipeButton: UIButton!
    static let nibName = "DishStaticCell"
    static let reuseId = "DishStaticCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    private func configure() {
        self.recipeButton.layer.cornerRadius = 20
        self.recipeButton.backgroundColor = UIColor(red: 0.929, green: 0.929, blue: 0.929, alpha: 1)
    }
    @IBAction func cookingButtonAction(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("PerformSegue"), object: nil, userInfo: nil)
    }
}
