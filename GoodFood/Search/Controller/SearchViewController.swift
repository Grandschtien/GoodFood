//
//  SearchViewController.swift
//  GoodFood
//
//  Created by Егор Шкарин on 12.08.2021.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var searchController = UISearchController()
    private var menuPoints = Bundle.main.decode([MenuModel].self, from: "Menu.json").filter { menuModel in
        return menuModel.type == MenuType.Menu.rawValue
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = searchController
        searchController.delegate = self
        tableView.dataSource = self
    }

}


extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let countOfMenuPoints = menuPoints.first?.menuPoints?.count else {
            return 0
        }
        return countOfMenuPoints
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as? SearchCell else { return UITableViewCell()}
        cell.configure(menuPoint: (menuPoints.first?.menuPoints?[indexPath.row])!)
        return cell
    }
    
    
}
extension SearchViewController: UISearchControllerDelegate {
    
}
