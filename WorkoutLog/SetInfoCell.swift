//
//  ExerciseSetCell.swift
//  WorkoutLog
//
//  Created by Alec Barton on 6/14/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

class SetInfoCell: UICollectionViewCell {
    
    static let id = "SetInfoId"
    static let height: CGFloat = 40.0
    
    private lazy var setLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var label: String? {
        didSet {
            setLabel.text = label
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        backgroundColor = .white
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = SetInfoCell.height / 2.0
        
        addSubview(setLabel)
        NSLayoutConstraint.activate([
            setLabel.topAnchor.constraint(equalTo: self.topAnchor),
            setLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            setLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            setLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        
        setLabel.text = "PLACE"
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
