//
//  WorkoutHeaderView.swift
//  WorkoutLog
//
//  Created by Alec Barton on 7/5/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

class WorkoutHeaderView: UIView {
    static let id = "WorkoutHeaderCellId"
    static let height:CGFloat = 30.0
    
    var title: String? {
        didSet{
            label.text = title
        }
    }
    
    private lazy var collapseButton: UIButton = {
        let button = UIButton()
        button.setTitle("OPEN", for: .normal)
        button.backgroundColor = .systemTeal
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "WORKOUT_NAME"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        self.backgroundColor = .white
        
        addSubview(collapseButton)
        addSubview(label)
        
        NSLayoutConstraint.activate([
            collapseButton.topAnchor.constraint(equalTo: topAnchor),
            collapseButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            collapseButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0),

            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.leadingAnchor.constraint(equalTo: collapseButton.trailingAnchor, constant: 10.0),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

