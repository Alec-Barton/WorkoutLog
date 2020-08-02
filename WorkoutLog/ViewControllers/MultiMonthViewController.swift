//
//  MultiMonthViewController.swift
//  WorkoutLog
//
//  Created by Alec Barton on 7/21/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import Foundation
import UIKit

class MultiMonthViewController:  UICollectionViewController {
    
    let padding: CGFloat = 30
    var years: [Year] = {
        var array:[Year] = []
        if let year2020 = Year(year: 2020){
            array.append(year2020)
        }
        if let year2021 = Year(year: 2021){
            array.append(year2021)
        }
        return array
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TemplateManager.shared.setup()
        
        setup()
        registerIds()
        
    }
    
    private func setup() {
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
        }
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = ColorTheme.lightGray1
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
        return years.count
    }
        
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DateHeaderView.id, for: indexPath) as! DateHeaderView
        header.year = years[indexPath.section]
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 50.0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return years[section].numberOfCells
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let year = years[indexPath.section]
        let dayPadding = year.dayOffset
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DayCell.id, for: indexPath) as! DayCell
        if indexPath.row >= dayPadding && indexPath.row < year.daysInYear + dayPadding{
            
            cell.date = indexPath.row - dayPadding + 1
            cell.backgroundColor = ColorTheme.lightGray4
        } else {
            cell.backgroundColor = ColorTheme.lightGray2
            cell.date = 0
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = view.frame.width/14 - 10
        return .init(width: size, height: size)
    }
}

