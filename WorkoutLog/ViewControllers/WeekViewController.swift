//
//  WeekViewController.swift
//  WorkoutLog
//
//  Created by Alec Barton on 9/20/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

class WeekViewController: UICollectionViewController {
    
    let cellSpacing: CGFloat = 4.0
    let padding: CGFloat = 30.0
    
    private lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.text = "Weekly View"
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir Next Condensed", size: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    convenience init () {
//        self.init(style: UITableView.Style.grouped)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = ColorTheme.lightGray1
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        setup()
        registerIds()
    }
    
    private func setup() {
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = .init(top: 0.0, left: padding, bottom: padding, right: padding)
        }
        
        view.backgroundColor = ColorTheme.lightGray1
        collectionView.backgroundColor = ColorTheme.lightGray1
        collectionView.contentInsetAdjustmentBehavior = .never
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaTopAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func registerIds () {
        collectionView.register(WeekHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: WeekHeaderView.id)
        
//        collectionView.register(WeekdayCell.self, forCellWithReuseIdentifier: WeekdayCell.id)
        collectionView.register(WeekCollectionCell.self, forCellWithReuseIdentifier: WeekCollectionCell.id)
    }
    
}

extension WeekViewController: UICollectionViewDelegateFlowLayout {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 52
    }
        
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: WeekHeaderView.id, for: indexPath) as! WeekHeaderView
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 100.0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeekCollectionCell.id, for: indexPath) as! WeekCollectionCell
        cell.backgroundColor = ColorTheme.lightGray4
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = view.frame.width - (2 * padding)
        let height: CGFloat = 60.0
        return CGSize(width: width, height: height)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        //TODO: Re-adjust this
//        return 5.0
//    }
}
