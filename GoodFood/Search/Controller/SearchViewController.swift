//
//  SearchViewController.swift
//  GoodFood
//
//  Created by Егор Шкарин on 12.08.2021.
//

import UIKit

class SearchViewController: UIViewController {

    private var searchController = UISearchController()
    private var segmentControl: UISegmentedControl! = nil
    private var menuPoints = Bundle.main.decode([MenuModel].self, from: "Menu.json").filter { menuModel in
        return menuModel.type == MenuType.Menu.rawValue
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UINib(nibName: SearchCell.nibName, bundle: nil), forCellReuseIdentifier: SearchCell.reuseId)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = searchController
        searchController.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.reuseId, for: indexPath) as? SearchCell else { return UITableViewCell()}
        cell.configure(menuPoint: (menuPoints.first?.menuPoints?[indexPath.row])!)
        return cell
    }
    
    
}
extension SearchViewController: UISearchControllerDelegate {
    
}

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
}
