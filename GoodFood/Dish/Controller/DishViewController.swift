//
//  DishViewController.swift
//  GoodFood
//
//  Created by Егор Шкарин on 24.08.2021.
//

import UIKit

class DishViewController: UIViewController {
    var nameOfDish: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = nameOfDish
        navigationController?.tabBarItem.title = "Назад"
    }
    
    @IBAction func backAction(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
}

extension DishViewController {
    
}
