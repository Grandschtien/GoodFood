//
//  StepCell.swift
//  GoodFood
//
//  Created by Егор Шкарин on 25.08.2021.
//

import UIKit

class StepCell: UITableViewCell {
    @IBOutlet weak var stepImage: UIImageView!
    @IBOutlet weak var stepLabel: UILabel!
    
    static let reuseId = "StepCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure() {
        
    }

}
