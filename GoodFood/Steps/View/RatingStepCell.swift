//
//  RatingStepCell.swift
//  GoodFood
//
//  Created by Егор Шкарин on 25.08.2021.
//

import UIKit
import Cosmos
class RatingStepCell: UITableViewCell {

    @IBOutlet weak var rating: CosmosView!
    static let reuseId = "RatingStepCell"
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func configure() {
        
    }
    
}
