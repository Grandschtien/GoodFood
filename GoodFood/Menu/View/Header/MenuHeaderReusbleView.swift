//
//  MenuHeaderReusbleView.swift
//  GoodFood
//
//  Created by Егор Шкарин on 12.08.2021.
//

import UIKit

class MenuHeaderReusbleView: UICollectionReusableView {
    @IBOutlet private weak var kitchenCollection: UICollectionView!
    
    static let nibName = "MenuHeaderReusbleView"
    static let reusbleID = "MenuHeaderReusbleView"
    
    var kitchens: [MenuModel]?
    func configureCollectionView() {
        //kitchenCollection.delegate = self
        kitchenCollection.dataSource = self
        kitchenCollection.register(UINib(nibName: HeaderCell.nibName, bundle: nil), forCellWithReuseIdentifier: HeaderCell.reuseId)
        kitchenCollection.backgroundColor = #colorLiteral(red: 0.880524771, green: 0.9031272657, blue: 0.875127862, alpha: 1)
        kitchenCollection.alpha = 1
        kitchenCollection.reloadData()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollectionView()
    }
}

extension MenuHeaderReusbleView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let countOfKitchens = kitchens?.first?.headerItems?.count else {
            return 0
        }
        return countOfKitchens
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = kitchenCollection.dequeueReusableCell(withReuseIdentifier: HeaderCell.reuseId, for: indexPath) as? HeaderCell else { return UICollectionViewCell()}
        guard let kitchen = kitchens?.first?.headerItems?[indexPath.item] else { return UICollectionViewCell() }
        cell.configure(headerItem: kitchen)
        return cell
    }
    
    
}
