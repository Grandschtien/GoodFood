//
//  HeaderCell.swift
//  GoodFood
//
//  Created by Егор Шкарин on 13.08.2021.
//

import UIKit

class HeaderCell: UICollectionViewCell {

    @IBOutlet weak var kitchenLabel: UILabel!
    static let nibName = "HeaderCell"
    static let reuseId = "HeaderCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(headerItem: HeaderItem) {
        self.kitchenLabel.text = headerItem.name
        self.kitchenLabel.textAlignment = .center
        self.kitchenLabel.font.withSize(15)
        self.layer.cornerRadius = self.frame.height / 2
        self.backgroundColor = #colorLiteral(red: 0.3680835837, green: 0.6592020387, blue: 1, alpha: 1)
    }
}
