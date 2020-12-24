//
//  AddExerciseCollectionCell.swift
//  WorkoutLog
//
//  Created by Alec Barton on 12/24/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

class AddExerciseCollectionCell: UICollectionViewCell {
    static let id = "AddExerciseCellId"

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("   + \t Add New Exercise", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.layer.borderColor = ColorTheme.lightGray4.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = 5.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            button.topAnchor.constraint(equalTo: self.topAnchor),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    @objc private func buttonTapped(_ sender: Any) {
        print("addExercise button tapped")
    }
}
