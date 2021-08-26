//
//  DishViewController.swift
//  GoodFood
//
//  Created by Егор Шкарин on 24.08.2021.
//

import UIKit

class DishViewController: UIViewController {
    var nameOfDish: String = ""
    @IBOutlet weak var dishTableView: UITableView!
    @IBOutlet weak var likedButton: UIBarButtonItem!
    private var dish = [Dish]()
    private var isLiked = false
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDish()
        setUpAllVeiws()
    }
    
    private func setUpAllVeiws() {
        title = nameOfDish
        navigationController?.tabBarItem.title = "Назад"
        navigationController?.navigationItem.rightBarButtonItem?.image = UIImage(systemName: "photo.fill")
        dishTableView.dataSource = self
        dishTableView.delegate = self
        dishTableView.register(UINib(nibName: DishStaticCell.nibName, bundle: nil), forCellReuseIdentifier: DishStaticCell.reuseId)
        NotificationCenter.default.addObserver(self, selector: #selector(recieveNotification), name: Notification.Name("PerformSegue"), object: nil)
    }
    
    private func fetchDish() {
        dish = Bundle.main.decode([Dish].self, from: "dish.json").filter({ dish in
            return dish.name == nameOfDish
        })
    }
    
    @IBAction func backAction(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func likedAction(_ sender: UIBarButtonItem) {
        if !isLiked {
            likedButton.image = UIImage(named: "filledStar 2")
        } else {
            likedButton.image = UIImage(systemName: "star")
        }
        isLiked = !isLiked
    }
    
}

//MARK:- DataSource
extension DishViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            guard let countOfIngredients = dish.first?.ingrdients?.count else { return 0}
            return countOfIngredients
        default:
            return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = dishTableView.dequeueReusableCell(withIdentifier: DishCell.reuseId) as? DishCell else { return UITableViewCell()}
        guard let staticCell = dishTableView.dequeueReusableCell(withIdentifier: DishStaticCell.reuseId) as? DishStaticCell else { return UITableViewCell() }
        switch indexPath.section {
        case 0:
            guard let ingredient = dish.first?.ingrdients?[indexPath.row] else { return UITableViewCell()}
            cell.configure(with: ingredient)
            cell.selectionStyle = .none
            return cell
        default:
            staticCell.selectionStyle = .none
            return staticCell
        }
       
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed("ImageDishStaticCell", owner: self, options: nil)?.first as? ImageDishStaticCell
        let image = dish.first?.image ?? ""
        headerView?.configure(image: UIImage(named: image))
        switch section {
        case 0:
            return headerView
        default:
            return nil
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 253
        default:
            return 0
        }
    }
    
}
//MARK:- Delegate
extension DishViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = dishTableView.cellForRow(at: indexPath) as? DishCell else { return }
        cell.check()
    }
}

extension DishViewController {
    @objc private func recieveNotification() {
        performSegue(withIdentifier: "CookingSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "CookingSegue", let destinatinVC = segue.destination as? StepsViewController else { return }
        destinatinVC.nameOfCurrentDish = nameOfDish
    }
}
