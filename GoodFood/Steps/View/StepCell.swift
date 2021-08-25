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
    func configure(step: Step) {
        self.stepImage.image = UIImage(named: step.image ?? "photo.fill")
        stepImage.contentMode = .scaleAspectFit
        self.stepLabel.text = step.step
    }

}
