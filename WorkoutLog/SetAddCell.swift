//
//  ExerciseAddSetCell.swift
//  WorkoutLog
//
//  Created by Alec Barton on 6/14/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

class SetAddCell: UICollectionViewCell {
    
    static let id = "SetAddCellId"
    static let height: CGFloat = 40.0
    
    private lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = SetAddCell.height/2
        button.addTarget(self, action: #selector(didTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

     override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        addSubview(addButton)
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: self.topAnchor),
            addButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            addButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            addButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    @objc private func didTap() {
        print("ADD")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
