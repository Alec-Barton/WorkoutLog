//
//  MultiMonthViewController.swift
//  WorkoutLog
//
//  Created by Alec Barton on 7/21/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import Foundation
import UIKit

class MultiMonthViewController: UICollectionViewController {
    
    let padding: CGFloat = 3
    var months: [Month] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TemplateManager.shared.setup()
        
        setup()
        registerIds()
        
        for i in 1...12 {
            if let month = Month(month: i, year: 2020) {
                months.append(month)
            }
        }
    }
    
    private func setup() {
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
        }
        
        collectionView.backgroundColor = .gray
        collectionView.contentInsetAdjustmentBehavior = .never
    }
    
    private func registerIds () {
        collectionView.register(DateHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DateHeaderView.id)
        
        collectionView.register(WeekdayCell.self, forCellWithReuseIdentifier: WeekdayCell.id)
        collectionView.register(DayCell.self, forCellWithReuseIdentifier: DayCell.id)
    }
}

extension MultiMonthViewController: UICollectionViewDelegateFlowLayout {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return months.count
    }
        
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DateHeaderView.id, for: indexPath) as! DateHeaderView
        header.month = months[indexPath.section]
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 100.0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return months[section].numberOfCells + 7
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row < 7 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeekdayCell.id, for: indexPath) as! WeekdayCell
            cell.day = WeekdayName(rawValue: indexPath.row + 1)
            return cell
        } else {
            let month = months[indexPath.section]
            let dayPadding = (month.startingDay.rawValue) + 6
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayCell.id, for: indexPath) as! DayCell
            if indexPath.row >= dayPadding && indexPath.row < month.daysInMonth + dayPadding{
                
                cell.date = indexPath.row - dayPadding + 1
                cell.backgroundColor = .cyan
            } else {
                cell.backgroundColor = ColorTheme.lightGray1
                cell.date = 0
            }
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = view.frame.width/7 - 10
        
         if indexPath.row < 7 {
            return .init(width: size, height: 30.0)
         } else {
            return .init(width: size, height: size)
        }
        
    }
}
