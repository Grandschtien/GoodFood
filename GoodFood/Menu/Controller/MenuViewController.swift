//
//  ViewController.swift
//  GoodFood
//
//  Created by Егор Шкарин on 09.08.2021.
//

import UIKit

class MenuViewController: UIViewController {
    
    private var menuCollection: UICollectionView! = nil
    fileprivate var dataSource: UICollectionViewDiffableDataSource<MenuModel, MenuPoint>! = nil
    private static let sectionBackgroundDecorationElementKind = "background-element-kind"
    private static let sectionHeaderElementKind = "section-header-element-kind"
    
    private var menuPoints = Bundle.main.decode([MenuModel].self, from: "Menu.json")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Меню"
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.shadowImage = UIImage()
        configure()
        configureDataSource()
        
    }
    
    private func configure() {
        menuCollection = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        menuCollection?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        menuCollection?.backgroundColor = #colorLiteral(red: 0.880524771, green: 0.9031272657, blue: 0.875127862, alpha: 1)
        navigationController?.navigationBar.barTintColor = menuCollection.backgroundColor
        view.addSubview(menuCollection!)
        menuCollection.showsVerticalScrollIndicator = false
        menuCollection.showsHorizontalScrollIndicator = false
    }
    
}

//MARK:- Create layout
extension MenuViewController {
    private func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {[weak self](sectionIndex: Int,
                                                                      layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            guard let menuPoint = self?.menuPoints.first else { return nil }
            switch menuPoint.type {
            default:
                return self?.createMenuPointSection()
            }
            
        }
        layout.register(MenuBackgroundReusableView.self, forDecorationViewOfKind: MenuViewController.sectionBackgroundDecorationElementKind)
        return layout
    }
}

//MARK:- Create Sections
extension MenuViewController {
    private func createMenuPointSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(150))
        
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        
        group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        
        let sectionBackgroundDecoration = NSCollectionLayoutDecorationItem.background(elementKind: MenuViewController.sectionBackgroundDecorationElementKind)
        sectionBackgroundDecoration.contentInsets = NSDirectionalEdgeInsets(top: 80, leading: 0, bottom: 0, trailing: 0)
        section.decorationItems = [sectionBackgroundDecoration]
        //        let header = createHeader()
        //        section.boundarySupplementaryItems = [header]
        return section
    }
}

//MARK:- Create DataSource

extension MenuViewController {
    private func configureDataSource() {
        
        //        let headerRegistration =
        //            UICollectionView.SupplementaryRegistration<SecondSectionHeader>(supplementaryNib: UINib(nibName: NibName.sectionHeader.rawValue, bundle: nil), elementKind: Self.sectionHeaderElementKind) {[weak self] header, string, indexPath in
        //                header.sections = self?.sectionForHeader
        //            }
        
        
        let menuPointCellRegistration = UICollectionView.CellRegistration<MenuPointCell, MenuPoint>(cellNib: UINib(nibName: MenuPointCell.nibName, bundle: nil)) { cell, indexPath, menuPoint in
            cell.configure(menuPoint: menuPoint)
        }
        
        self.dataSource = UICollectionViewDiffableDataSource<MenuModel, MenuPoint>(collectionView: menuCollection) {
            (collectionView: UICollectionView, indexPath: IndexPath, item: MenuPoint) -> UICollectionViewCell? in
                return collectionView.dequeueConfiguredReusableCell(using: menuPointCellRegistration, for: indexPath, item: item)
        }
        //TODO: Сделать заголовок
        // Регистрация заголовка
        //        self.dataSource.supplementaryViewProvider = {
        //            collectionView, kind, indexPath in
        //            print("kind \(kind) for section: \(indexPath.section) and item: \(indexPath.item)")
        //            return collectionView.dequeueConfiguredReusableSupplementary(using: headerRegistration, for: indexPath)
        //        }
        
        var snapshot = NSDiffableDataSourceSnapshot<MenuModel, MenuPoint>()
        menuPoints.forEach { menu in
            snapshot.appendSections([menu])
            snapshot.appendItems(menu.menuPoints, toSection: menu)
        }
        
        dataSource?.apply(snapshot)
    }
    
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<MenuModel, MenuPoint>()
        menuPoints.forEach { menu in
            snapshot.appendSections([menu])
            snapshot.appendItems(menu.menuPoints, toSection: menu)
        }
        
        dataSource?.apply(snapshot)
    }
}
