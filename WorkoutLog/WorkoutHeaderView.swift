//
//  WorkoutHeaderView.swift
//  WorkoutLog
//
//  Created by Alec Barton on 7/5/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

protocol WorkoutHeaderViewDelegate: AnyObject {
    func toggleOpen(_ view: WorkoutHeaderView)
}

class WorkoutHeaderView: UIView {
    static let id = "WorkoutHeaderCellId"
    static let height:CGFloat = 30.0
    
    var delegate: WorkoutHeaderViewDelegate?
    
    var section: Int?
    var workout: Workout? {
        didSet{
            label.text = workout?.name
        }
    }
    
    private lazy var openButton: UIButton = {
        let button = UIButton()
        button.setTitle(">", for: .normal)
        button.backgroundColor = .systemTeal
        button.layer.cornerRadius = 15.0
        button.addTarget(self, action: #selector(openButtonDidTap), for: .touchUpInside)
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
        
        addSubview(openButton)
        addSubview(label)
        
        NSLayoutConstraint.activate([
            openButton.topAnchor.constraint(equalTo: topAnchor),
            openButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            openButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0),

            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.leadingAnchor.constraint(equalTo: openButton.trailingAnchor, constant: 10.0),
            label.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc private func openButtonDidTap(_ sender: UITapGestureRecognizer?){
        delegate?.toggleOpen(self)
    }
}

