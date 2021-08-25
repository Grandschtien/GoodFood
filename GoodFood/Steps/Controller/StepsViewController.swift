//
//  StepsViewController.swift
//  GoodFood
//
//  Created by Егор Шкарин on 25.08.2021.
//

import UIKit

class StepsViewController: UIViewController {
    @IBOutlet weak var stepsTableView: UITableView!
    private var steps = [Cooking]()
    var nameOfCurrentDish = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchSteps()
        setupTableView()
    }
    
    private func setupTableView() {
        stepsTableView.dataSource = self
        stepsTableView.register(UINib(nibName: RatingStepCell.nibName, bundle: nil), forCellReuseIdentifier: RatingStepCell.reuseId)
    }
    private func fetchSteps() {
        steps = Bundle.main.decode([Cooking].self, from: "Steps.json").filter({ step in
            return step.name == nameOfCurrentDish
        })
    }

}
extension StepsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            guard let countOfSteps = steps.first?.steps?.count else { return 0 }
            return countOfSteps
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = stepsTableView.dequeueReusableCell(withIdentifier: StepCell.reuseId) as? StepCell else { return UITableViewCell()}
        guard let ratingCell = stepsTableView.dequeueReusableCell(withIdentifier: RatingStepCell.reuseId) as? RatingStepCell else {
            return UITableViewCell()
        }
        
        switch indexPath.section {
        case 0:
            guard let step = steps.first?.steps?[indexPath.row] else { return UITableViewCell()}
            cell.configure(step: step)
            cell.selectionStyle = .none
            return cell
        default:
            ratingCell.selectionStyle = .none
            return ratingCell
        }
    }
}
