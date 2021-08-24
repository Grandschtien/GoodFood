//
//  SearchViewController.swift
//  GoodFood
//
//  Created by Егор Шкарин on 12.08.2021.
//

import UIKit

class SearchViewController: UIViewController {
    
    private var indexPathForSelectedRow = IndexPath()
    private var searchController = UISearchController()
    private var segmentedControl = UISegmentedControl(items: [
        "С мясом",
        "Без мяса"
    ])
    private var menuPoints = Bundle.main.decode([MenuModel].self, from: "Menu.json").filter { menuModel in
        return menuModel.type == MenuType.Menu.rawValue
    }
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = searchController
        searchController.delegate = self

        setupTableView()
        setupSegmentedControl()
    }
    private func setupTableView() {
        tableView.register(UINib(nibName: SearchCell.nibName, bundle: nil), forCellReuseIdentifier: SearchCell.reuseId)
        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.backgroundColor = .tertiarySystemBackground
        view.addSubview(tableView)
    }
    private func setupSegmentedControl() {
        segmentedControl.selectedSegmentIndex = 0
        navigationItem.titleView = segmentedControl
        segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
    }
    //TODO MAke segment control
    @objc private func segmentChanged(_ sender: UISegmentedControl) { }
}


extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let countOfMenuPoints = menuPoints.first?.menuPoints?.count else {
            return 0
        }
        return countOfMenuPoints
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.reuseId, for: indexPath) as? SearchCell else { return UITableViewCell()}
        cell.configure(menuPoint: (menuPoints.first?.menuPoints?[indexPath.row])!)
        cell.selectionStyle = .none
        return cell
    }
    
    
}

extension SearchViewController: UISearchControllerDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
       
    }
}


extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexPathForSelectedRow = indexPath
        passData()
    }
}

extension SearchViewController {
    private func passData() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let dishViewController = storyboard.instantiateViewController(identifier: "DishViewController") as? DishViewController else {
            return
        }
        dishViewController.nameOfDish = menuPoints.first?.menuPoints?[indexPathForSelectedRow.row].name ?? "Без названия"
        show(dishViewController, sender: nil)
    }
}
