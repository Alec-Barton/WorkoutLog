//
//  ExerciseCell.swift
//  WorkoutLog
//
//  Created by Alec Barton on 6/13/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

class ExerciseCell: UITableViewCell {
    
    //TODO: dynamic height
    static let height: CGFloat = 100.0
    static let id = "ExerciseCellId"
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .cyan
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //TODO: not sure how I want this implemented yet
    private lazy var infoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("i", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //TODO: Implement
    private lazy var collectionView = 0
    
    var exerciseInstance: ExerciseInstance? {
        didSet {
            guard let template = exerciseInstance else { return }
            nameLabel.text = template.name
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
    }
    
    func setup() {
        self.backgroundColor = .white
        
        addSubview(nameLabel)
        addSubview(infoButton)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.0),
            nameLabel.trailingAnchor.constraint(equalTo: infoButton.leadingAnchor, constant: 10.0),
            nameLabel.heightAnchor.constraint(equalToConstant: 40.0),
            
            infoButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            infoButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10.0),
            infoButton.widthAnchor.constraint(equalToConstant: 40.0),
            infoButton.heightAnchor.constraint(equalToConstant: 40.0),
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
