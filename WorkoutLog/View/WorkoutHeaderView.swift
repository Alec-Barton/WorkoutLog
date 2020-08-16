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
    static let height:CGFloat = 50.0
    
    var delegate: WorkoutHeaderViewDelegate?
    
    var section: Int?
    var workout: Workout? {
        didSet{
            label.text = workout?.name
        }
    }

    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var moreButton: UIButton = {
       let button = UIButton()
       button.setImage(UIImage(named: "ellipsisIcon"), for: .normal)
       button.translatesAutoresizingMaskIntoConstraints = false
       return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        addSubview(label)
        addSubview(moreButton)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.leadingAnchor.constraint(equalTo: self.safeAreaLeadingAnchor, constant: 10.0),
            label.heightAnchor.constraint(equalToConstant: WorkoutHeaderView.height),
            
            moreButton.heightAnchor.constraint(equalToConstant: WorkoutHeaderView.height * 0.75),
            moreButton.widthAnchor.constraint(equalToConstant: WorkoutHeaderView.height * 0.75),
            moreButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -7.5),
            moreButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc private func openButtonDidTap(_ sender: UITapGestureRecognizer?){
        delegate?.toggleOpen(self)
    }
}

