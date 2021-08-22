//
//  ViewController.swift
//  GoodFood
//
//  Created by Егор Шкарин on 09.08.2021.
//

import UIKit

enum MenuType: String {
    case Menu
    case Header
}

class MenuViewController: UIViewController {
    
    private var menuCollection: UICollectionView! = nil
    fileprivate var dataSource: UICollectionViewDiffableDataSource<MenuModel, MenuPoint>! = nil
    private static let sectionBackgroundDecorationElementKind = "background-element-kind"
    private static let sectionHeaderElementKind = "section-header-element-kind"
    
    private var menuPoints = Bundle.main.decode([MenuModel].self, from: "Menu.json").filter { menuModel in
        return menuModel.type == MenuType.Menu.rawValue
    }
    private var headerPoints = Bundle.main.decode([MenuModel].self, from: "Menu.json").filter { menuModel in
        return menuModel.type == MenuType.Header.rawValue
    }
    
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
        menuCollection?.backgroundColor = UIColor(red: 0.938, green: 0.938, blue: 0.938, alpha: 1)
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
        
        //Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(200))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        //Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(200))
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        //Section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 0)
        //Section Decoration
        let sectionBackgroundDecoration = NSCollectionLayoutDecorationItem.background(elementKind: MenuViewController.sectionBackgroundDecorationElementKind)
        sectionBackgroundDecoration.contentInsets = NSDirectionalEdgeInsets(top: 120, leading: 0, bottom: 0, trailing: 0)
        section.decorationItems = [sectionBackgroundDecoration]
        let header = createHeader()
        section.boundarySupplementaryItems = [header]
        
        return section
    }
}

//MARK:- Create DataSource

extension MenuViewController {
    private func configureDataSource() {
        
        let headerRegistration =
            UICollectionView.SupplementaryRegistration<MenuHeaderReusbleView>(supplementaryNib: UINib(nibName: MenuHeaderReusbleView.nibName, bundle: nil), elementKind: Self.sectionHeaderElementKind) {[weak self] header, string, indexPath in
                header.kitchens = self?.headerPoints
            }
        
        
        let menuPointCellRegistration = UICollectionView.CellRegistration<MenuPointCell, MenuPoint>(cellNib: UINib(nibName: MenuPointCell.nibName, bundle: nil)) { cell, indexPath, menuPoint in
            cell.configure(menuPoint: menuPoint)
        }
        
        self.dataSource = UICollectionViewDiffableDataSource<MenuModel, MenuPoint>(collectionView: menuCollection) {
            (collectionView: UICollectionView, indexPath: IndexPath, item: MenuPoint) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: menuPointCellRegistration, for: indexPath, item: item)
        }
        
        //Регистрация заголовка
        self.dataSource.supplementaryViewProvider = {
            collectionView, kind, indexPath in
            return collectionView.dequeueConfiguredReusableSupplementary(using: headerRegistration, for: indexPath)
        }
        
        var snapshot = NSDiffableDataSourceSnapshot<MenuModel, MenuPoint>()
        menuPoints.forEach { menu in
            snapshot.appendSections([menu])
            snapshot.appendItems(menu.menuPoints ?? [], toSection: menu)
        }
        
        dataSource?.apply(snapshot)
    }
    
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<MenuModel, MenuPoint>()
        menuPoints.forEach { menu in
            snapshot.appendSections([menu])
            snapshot.appendItems(menu.menuPoints ?? [], toSection: menu)
        }
        
        dataSource?.apply(snapshot)
    }
}


extension MenuViewController {
    private func createHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(80))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        //header.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 100, trailing: 0)
        header.pinToVisibleBounds = true
        header.zIndex = 2
        return header
    }
}



