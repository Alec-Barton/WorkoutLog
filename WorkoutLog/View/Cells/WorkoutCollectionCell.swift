//  WorkoutCollectionCell.swift
//  WorkoutLog
//
//  Created by Alec Barton on 12/5/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

class ExerciseCollectionCell: UICollectionViewCell {
    
    static let id = "ExerciseCellId"
    
    private static let horizontalCellPadding: CGFloat = 3.0
    private static let verticalCellPadding: CGFloat = 3.0
    private static let additionalHeight: CGFloat = 30.0 + 5.0 + 10.0
    
    var exercise: ExerciseModel? {
        didSet {
            titleLabel.text = exercise?.name
        }
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var setCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = ExerciseCollectionCell.horizontalCellPadding
        layout.minimumLineSpacing = ExerciseCollectionCell.verticalCellPadding
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        registerIds()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.addSubview(titleLabel)
        self.addSubview(setCollectionView)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0),
            titleLabel.trailingAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30.0),
            
            setCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5.0),
            setCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10.0),
            setCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0),
            setCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20.0),
        ])
    }
    
    private func registerIds() {
        setCollectionView.register(SetCollectionCell.self, forCellWithReuseIdentifier: SetCollectionCell.id)
        setCollectionView.register(AddSetCollectionCell.self, forCellWithReuseIdentifier: AddSetCollectionCell.id)
    }
    
    static func sizeFor(_ model: ExerciseModel) -> CGSize {
        let collectionViewWidth = UIScreen.main.bounds.width - (20.0 * 2)

        var cellWidths: [CGFloat] = []
        cellWidths.append(AddSetCollectionCell.cellSize)
        for set in model.setArray {
            cellWidths.append(SetCollectionCell.sizeFor(set).width)
        }
        
        let contentSize = UICollectionView.contentSizeFor(collectionViewWidth: collectionViewWidth, cellWidths: cellWidths, cellHeight: SetCollectionCell.cellHeight, verticalPadding: ExerciseCollectionCell.verticalCellPadding, horizontalPadding: ExerciseCollectionCell.horizontalCellPadding)
        return CGSize(width: UIScreen.main.bounds.width, height: contentSize.height + ExerciseCollectionCell.additionalHeight)
    }
}

extension ExerciseCollectionCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let exercise = exercise else { return 1 }
        return exercise.setArray.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddSetCollectionCell.id, for: indexPath) as! AddSetCollectionCell
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SetCollectionCell.id, for: indexPath) as! SetCollectionCell
        if let exercise = exercise {
            cell.set = exercise.setArray[indexPath.row - 1]
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: AddSetCollectionCell.cellSize, height: AddSetCollectionCell.cellSize)
        }
        guard let exercise = exercise else { return .zero }
        return SetCollectionCell.sizeFor(exercise.setArray[indexPath.row - 1])
    }
}
