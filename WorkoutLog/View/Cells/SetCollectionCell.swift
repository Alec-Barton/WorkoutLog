//
//  SetCollectionCell.swift
//  WorkoutLog
//
//  Created by Alec Barton on 12/22/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

class SetCollectionCell: UICollectionViewCell {
    static let id = "SetCellId"
    static let cellHeight: CGFloat = 30.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.backgroundColor = .orange
    }
    
    static func sizeFor(_ model: SetModel) -> CGSize {
        let sizingLabel = UILabel()
        sizingLabel.text = model.label
        sizingLabel.sizeToFit()
        return CGSize(width: sizingLabel.frame.width, height: cellHeight)
    }
}
