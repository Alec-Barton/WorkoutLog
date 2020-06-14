//
//  ExerciseCell.swift
//  WorkoutLog
//
//  Created by Alec Barton on 6/13/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

class ExerciseCell: UITableViewCell {
    
    static let id = "ExerciseCellId"
    //TODO: dynamic height
    static let height: CGFloat = 100.0
    
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
    private lazy var collectionView: UICollectionView  = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var exercise: Exercise? {
        didSet {
            guard let template = exercise else { return }
            nameLabel.text = template.name
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SetInfoCell.self, forCellWithReuseIdentifier: SetInfoCell.id)
        collectionView.register(SetAddCell.self, forCellWithReuseIdentifier: SetAddCell.id)
    }
    
    func setup() {
        self.backgroundColor = .white
        
        addSubview(nameLabel)
        addSubview(infoButton)
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.0),
            nameLabel.trailingAnchor.constraint(equalTo: infoButton.leadingAnchor, constant: -10.0),
            nameLabel.heightAnchor.constraint(equalToConstant: 40.0),
            
            infoButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            infoButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10.0),
            infoButton.widthAnchor.constraint(equalToConstant: 40.0),
            infoButton.heightAnchor.constraint(equalToConstant: 40.0),
            
            collectionView.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 10.0),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10.0),
            collectionView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.95),
            collectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

extension ExerciseCell: UICollectionViewDelegate {
    
}

extension ExerciseCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SetAddCell.id, for: indexPath)
            cell.backgroundColor = .blue
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SetInfoCell.id, for: indexPath)
            cell.backgroundColor = .red
            return cell
        }
    }
    
}

extension ExerciseCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: 40.0, height: 40.0)

        } else {
            return CGSize(width: 100.0, height: 40.0)

        }
    }
}
