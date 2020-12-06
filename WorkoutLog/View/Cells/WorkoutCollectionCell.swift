//
//  WorkoutCollectionCell.swift
//  WorkoutLog
//
//  Created by Alec Barton on 12/5/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

class WorkoutCollectionCell: UICollectionViewCell {
    
    static let id = "WorkoutCellId"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var setCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        
    }
}
