//
//  LikedViewController.swift
//  GoodFood
//
//  Created by Егор Шкарин on 12.08.2021.
//

import UIKit

class LikedViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private let liked = Bundle.main.decode(Liked.self, from: "Liked.json")
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }

}


extension LikedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let countOfDishes = liked.likedModels?.count else { return 0 }
        return countOfDishes
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LikedCell.reuseId) as? LikedCell else { return UITableViewCell()}
        guard let liked = liked.likedModels?[indexPath.row] else { return UITableViewCell()}
        cell.isUserInteractionEnabled = false
        cell.configure(likedModel: liked)
        return cell
        
    }
    
    
}

extension LikedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
