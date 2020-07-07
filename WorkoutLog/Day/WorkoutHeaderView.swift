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
    
    private lazy var openButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "collapseIcon"), for: .normal)
//        button.setTitle(">", for: .normal)
//        button.backgroundColor = .systemTeal
//        button.layer.cornerRadius = 15.0
        button.addTarget(self, action: #selector(openButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    private lazy var infoButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(named: "infoIcon"), for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
    
//    private lazy var editButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(named: "editIcon"), for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
    
//    private lazy var deleteButton: UIButton = {
//       let button = UIButton()
//       button.setImage(UIImage(named: "deleteIcon"), for: .normal)
//       button.translatesAutoresizingMaskIntoConstraints = false
//       return button
//    }()
    
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
//        self.backgroundColor = .lightGray
        
        addSubview(openButton)
        addSubview(label)
//        addSubview(infoButton)
//        addSubview(editButton)
//        addSubview(deleteButton)
        addSubview(moreButton)
        
        NSLayoutConstraint.activate([
            openButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0),
            openButton.heightAnchor.constraint(equalToConstant: WorkoutHeaderView.height * 0.5),
            openButton.widthAnchor.constraint(equalToConstant: WorkoutHeaderView.height * 0.5),
            openButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),

            label.topAnchor.constraint(equalTo: topAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.leadingAnchor.constraint(equalTo: openButton.trailingAnchor, constant: 10.0),
            label.heightAnchor.constraint(equalToConstant: WorkoutHeaderView.height),
            
//            infoButton.heightAnchor.constraint(equalToConstant: WorkoutHeaderView.height * 0.5),
//            infoButton.widthAnchor.constraint(equalToConstant: WorkoutHeaderView.height * 0.5),
//            infoButton.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 20.0),
//            infoButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),

//            editButton.heightAnchor.constraint(equalToConstant: WorkoutHeaderView.height * 0.5),
//            editButton.widthAnchor.constraint(equalToConstant: WorkoutHeaderView.height * 0.5),
//            editButton.trailingAnchor.constraint(equalTo: deleteButton.leadingAnchor, constant: -10.0),
//            editButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),

//            deleteButton.heightAnchor.constraint(equalToConstant: WorkoutHeaderView.height * 0.5),
//            deleteButton.widthAnchor.constraint(equalToConstant: WorkoutHeaderView.height * 0.5),
//            deleteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5.0),
//            deleteButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
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

