//
//  WorkoutViewController.swift
//  WorkoutLog
//
//  Created by Alec Barton on 5/25/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

class EditorViewController: UICollectionViewController {
    
    let padding: CGFloat = 30
    let workouts = ["Chest Day", "Leg Day"]
    
    private lazy var titleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setup()
        registerIds()
    }
    
    private func setup() {
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
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
        collectionView.register(WorkoutHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: WorkoutHeaderView.id)
        collectionView.register(WorkoutCollectionCell.self, forCellWithReuseIdentifier: WorkoutCollectionCell.id)
        
    }
    
}

extension EditorViewController: UICollectionViewDelegateFlowLayout {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return workouts.count
    }
        
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: WorkoutHeaderView.id, for: indexPath) as! WorkoutHeaderView
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 50.0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WorkoutCollectionCell.id, for: indexPath) as! WorkoutCollectionCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = view.frame.width/14 - 10
        return .init(width: size, height: size)
    }
}




