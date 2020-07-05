//
//  ExerciseCell.swift
//  WorkoutLog
//
//  Created by Alec Barton on 6/13/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

protocol ExerciseCellDelegate: AnyObject {
    func editingStateChanged (_ cell: ExerciseCell, editingIndex: Int?)
}

class ExerciseCell: UITableViewCell {
    
    static let id = "ExerciseCellId"
//    static let height: CGFloat = 100.0
    
    var delegate: ExerciseCellDelegate?
    var exerciseIndex: Int?
    var setSelectedIndex: Int?
    var exercise: Exercise? {
        didSet {
            guard let exercise = exercise else { return }
            nameLabel.text = exercise.name
            
        }
    }
    
    //MARK: ExerciseCell - UI Elements
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    //TODO not sure how I want this implemented yet
    private lazy var infoButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("i", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.0
        button.layer.cornerRadius = ( 40.0 / 2 )
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var setEditor: SetEditorView = {
        let view = SetEditorView()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var setCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
//        flowLayout.estimatedItemSize = CGSize(width: 100, height: 100)
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
//        view.
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    var editorHeight:NSLayoutConstraint?
    var collectionViewHeight: NSLayoutConstraint?
    
    //MARK: ExerciseCell - Lifecycle Methods
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        setCollectionView.delegate = self
        setCollectionView.dataSource = self
        setCollectionView.register(SetInfoCell.self, forCellWithReuseIdentifier: SetInfoCell.id)
        setCollectionView.register(SetAddCell.self, forCellWithReuseIdentifier: SetAddCell.id)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setup() {
        self.addSubview(nameLabel)
        self.addSubview(infoButton)
        self.addSubview(setCollectionView)
//        self.addSubview(setEditor)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10.0),
            nameLabel.trailingAnchor.constraint(equalTo: infoButton.leadingAnchor, constant: -10.0),
            nameLabel.heightAnchor.constraint(equalToConstant: 40.0),
            
            infoButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10.0),
            infoButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10.0),
            infoButton.widthAnchor.constraint(equalToConstant: 40.0),
            infoButton.heightAnchor.constraint(equalToConstant: 40.0),
            
//            setEditor.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10.0),
//            setEditor.widthAnchor.constraint(equalTo: self.widthAnchor),
//            setEditor.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            setCollectionView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10.0),
            setCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20.0),
            setCollectionView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.95),
            setCollectionView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            setCollectionView.heightAnchor.constraint(equalToConstant: 200.0)
            
        ])
        
//        setEditor.isHidden = true
//        editorHeight = setEditor.heightAnchor.constraint(equalToConstant: 0)
//        editorHeight?.isActive = true
    }
    
    //MARK: ExerciseCell - Methods
    
    func beginEditing() {
//        setEditor.isHidden = false
//        self.editorHeight?.constant = 100.0
//        UIView.animate(withDuration: 0.25, animations: {
//            self.layoutIfNeeded()
//        })
//
//        if let delegate = delegate, let exerciseIndex = exerciseIndex {
//            delegate.editingStateChanged(self, editingIndex: exerciseIndex)
//        }
    }
    
    func endEditing() {
//        setSelectedIndex = nil
//        self.editorHeight?.constant = 0.0
//
//        UIView.animate(withDuration: 0.25, animations: {
//            self.layoutIfNeeded()
//        }, completion: { _ in
//            self.setEditor.isHidden = true
//        })
//        
//        if let delegate = delegate {
//            delegate.editingStateChanged(self, editingIndex: nil)
//        }
    }
}

extension ExerciseCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        if indexPath.row == 0 {
            setSelectedIndex = exercise?.setCount
            beginEditing()
        } else {
            setSelectedIndex = indexPath.row

        }
        self.setCollectionView.reloadData()
    }
}

extension ExerciseCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (exercise?.sets.count ?? 0) + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SetAddCell.id, for: indexPath) as! SetAddCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SetInfoCell.id, for: indexPath) as! SetInfoCell
            cell.label = exercise?.sets[indexPath.row - 1].string
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

extension ExerciseCell: SetEditorViewDelegate {
    func save() {
        endEditing()
    }
}
