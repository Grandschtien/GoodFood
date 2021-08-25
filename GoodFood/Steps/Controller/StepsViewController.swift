//
//  StepsViewController.swift
//  GoodFood
//
//  Created by Егор Шкарин on 25.08.2021.
//

import UIKit

class StepsViewController: UIViewController {
    @IBOutlet weak var stepsTableView: UITableView!
    private var steps = [Step]()
    var nameOfCurrentDish = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchSteps()
        setupTableView()
    }
    
    private func setupTableView() {
        stepsTableView.dataSource = self
    }
    private func fetchSteps() {
        steps = Bundle.main.decode([Step].self, from: "Steps.json")
    }

}
extension StepsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 4
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
            return cell
        default:
            return ratingCell
        }
    }
}
