//
//  UITextField+Extension.swift
//  GoodFood
//
//  Created by Егор Шкарин on 23.08.2021.
//

import UIKit


extension UITextField {
    /// Нижнее подчеркивание для тектового поля
    func setUnderLine() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.height - 1, width: self.frame.width, height: 1.0)
        bottomLine.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        self.borderStyle = UITextField.BorderStyle.none
        self.layer.addSublayer(bottomLine)
    }

}
