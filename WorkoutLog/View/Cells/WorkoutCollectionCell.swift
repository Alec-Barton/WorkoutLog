//
//  WorkoutCollectionCell.swift
//  WorkoutLog
//
//  Created by Alec Barton on 12/5/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

class WorkoutCollectionCell: UICollectionViewCell {
    
    static let id = "WorkoutCellId"
    var exercise: ExerciseModel?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Workout"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var setCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
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
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 30.0),
            
            setCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            setCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            setCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            setCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    private func registerIds() {
        setCollectionView.register(SetCollectionCell.self, forCellWithReuseIdentifier: SetCollectionCell.id)
    }
    
    static func sizeFor(_ model: ExerciseModel) -> CGSize {
        let collectionViewWidth = UIScreen.main.bounds.width

        var cellWidths: [CGFloat] = []
        for set in model.setArray {
            cellWidths.append(SetCollectionCell.sizeFor(set).width)
        }
        
        let contentSize = UICollectionView.contentSizeFor(collectionViewWidth: collectionViewWidth, cellWidths: cellWidths, cellHeight: SetCollectionCell.cellHeight, verticalPadding: 0.0, horizontalPadding: 0.0)
        print(contentSize.height)
        return CGSize(width: contentSize.width, height: contentSize.height + 30.0)
    }
}

extension WorkoutCollectionCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let exercise = exercise else { return 0 }
        return exercise.setArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SetCollectionCell.id, for: indexPath) as! SetCollectionCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //store workout
//        return CGSize(width: 10.0, height: 30.0)

        guard let exercise = exercise else { return .zero }
        print("OK2:", SetCollectionCell.sizeFor(exercise.setArray[indexPath.row]))

        return SetCollectionCell.sizeFor(exercise.setArray[indexPath.row])
//        return CGSize(width: 50.0, height: 30.0)
    }
    
    
}
