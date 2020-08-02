//
//  MonthCell.swift
//  WorkoutLog
//
//  Created by Alec Barton on 8/1/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import Foundation
import UIKit

class MonthCollectionCell: UICollectionViewCell {
    
    let padding: CGFloat = 3
    var months: [Month] = []
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .purple
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        TemplateManager.shared.setup()
        
        setup()
//        registerIds()
        
        for i in 1...12 {
            if let month = Month(month: i, year: 2020) {
                months.append(month)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setup() {
        self.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10.0),
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 10.0),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10.0),
        ])
    }
    
//    private func registerIds () {
//        collectionView.register(DateHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DateHeaderView.id)
//
//        collectionView.register(WeekdayCell.self, forCellWithReuseIdentifier: WeekdayCell.id)
//        collectionView.register(DayCell.self, forCellWithReuseIdentifier: DayCell.id)
//    }
}
