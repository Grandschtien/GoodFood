//
//  DishCell.swift
//  GoodFood
//
//  Created by Егор Шкарин on 25.08.2021.
//

import UIKit

class DishCell: UITableViewCell {
    @IBOutlet weak var ingredientLabel: UILabel!
    @IBOutlet weak var checkedButton: UIButton!
    private var isCheked = false
    static let reuseId = "DishCell"
    func configure(with ingr: Ingrdient) {
        ingredientLabel.text = "• \(ingr.ingrdient ?? "Ингредитент не доступен :(")"
    }
    func check() {
        if !isCheked {
            checkedButton.imageView?.image = UIImage(named: "checked")
        } else {
            checkedButton.imageView?.image = UIImage(named: "empty")
        }
        isCheked = !isCheked
    }
}
