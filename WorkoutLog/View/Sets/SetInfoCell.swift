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
        
        addSubview(setLabel)
        NSLayoutConstraint.activate([
            setLabel.topAnchor.constraint(equalTo: self.topAnchor),
            setLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            setLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            setLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    //MARK: SetInfoCell - Static Methods
    
    private static let sizingLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    static func sizeFor(text: String) -> CGSize {
        sizingLabel.text = text
        return sizingLabel.sizeThatFits(CGSize(
            width: 10, height: SetInfoCell.height
        ))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
