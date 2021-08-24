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
    private var indexPathForSelectedRow = IndexPath()
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
        
        cell.configure(likedModel: liked)
        cell.selectionStyle = .none
        return cell
        
    }
    
    
}

extension LikedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexPathForSelectedRow = indexPath
        passData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK:- Segue
extension LikedViewController {
    private func passData() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let dishViewController = storyboard.instantiateViewController(identifier: "DishViewController") as? DishViewController else {
            return
        }
        dishViewController.nameOfDish = liked.likedModels?[indexPathForSelectedRow.row].name ?? "Без названия"
        show(dishViewController, sender: nil)
    }
}
