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
    static let cellHeight: CGFloat = 35.0
    
    private static let horizontalPadding: CGFloat = 10.0
    
    var set: SetModel? {
        didSet {
            label.text = set?.label
        }
    }
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.backgroundColor = ColorTheme.lightGray1
        
        self.layer.borderColor = ColorTheme.lightGray4.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 5.0
        
        self.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    static func sizeFor(_ model: SetModel) -> CGSize {
        let sizingLabel = UILabel()
        sizingLabel.text = model.label
        sizingLabel.sizeToFit()
        let size = CGSize(
            width: sizingLabel.frame.width + (SetCollectionCell.horizontalPadding * 2),
            height: cellHeight
        )
        return size
    }
}
