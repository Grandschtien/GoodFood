//
//  ShadowExtension.swift
//  GoodFood
//
//  Created by Егор Шкарин on 22.08.2021.
//

import UIKit


extension UIView {
    
    func dropShadow() {
        //self.layer.cornerRadius = 15.0
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowRadius = 0.5
        self.layer.shadowOpacity = 0.3
        self.layer.masksToBounds = false
    }
}
