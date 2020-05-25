//
//  ViewController.swift
//  WorkoutLog
//
//  Created by Alec Barton on 4/23/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    
    let padding: CGFloat = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    fileprivate func setup() {
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
        }
        
        collectionView.backgroundColor = .gray
        collectionView.contentInsetAdjustmentBehavior = .never
                
        collectionView.register(MonthHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MonthHeaderView.id)
        collectionView.register(DayCell.self, forCellWithReuseIdentifier: DayCell.id)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
       let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MonthHeaderView.id, for: indexPath)
       return header
   }
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
       return .init(width: view.frame.width, height: 100.0)
   }
   
   override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 30
   }
   
   override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayCell.id, for: indexPath)
       cell.backgroundColor = .lightGray
       return cell
   }
   
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = view.frame.width/7 - 10
       return .init(width: size, height: size)
   }
}
