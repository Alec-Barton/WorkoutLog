//
//  ViewController.swift
//  WorkoutLog
//
//  Created by Alec Barton on 4/23/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UICollectionViewController {
    
    let padding: CGFloat = 3
    var months: [Month] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        registerIds()
        
        for i in 1...12 {
            if let month = Month(month: i, year: 2020) {
                months.append(month)
//                print(month.name)
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
        collectionView.register(MonthHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MonthHeaderView.id)
        
        collectionView.register(WeekdayCell.self, forCellWithReuseIdentifier: WeekdayCell.id)
        collectionView.register(DayCell.self, forCellWithReuseIdentifier: DayCell.id)
        
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return months.count
    }
        
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MonthHeaderView.id, for: indexPath) as! MonthHeaderView
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
                cell.backgroundColor = .lightGray
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
