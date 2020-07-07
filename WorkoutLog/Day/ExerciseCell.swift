//
//  ExerciseCell.swift
//  WorkoutLog
//
//  Created by Alec Barton on 6/13/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

protocol ExerciseCellDelegate: AnyObject {
    func editingStateChanged (_ cell: ExerciseCell, editingIndex: IndexPath?)
}

class ExerciseCell: UITableViewCell {
    
    static let id = "ExerciseCellId"
    
//    public var dynamicCellHeight: CGFloat {
//        return dynamicTableHeight + 60.0
//    }
    private var dynamicTableHeight: CGFloat {
        guard var setCount = exercise?.sets.count else { return 50.0 }
        setCount = setCount == 0 ? 1 : setCount
        let offset = setCount % 3 == 0 ? 0 : 1
        return (CGFloat(setCount / 3 + offset) * 50.0)
    }
    private var tableHeigthAnchor:NSLayoutConstraint?
    
    var delegate: ExerciseCellDelegate?
    var index: IndexPath?
    var editorOpen: Bool = false
    var setSelectedIndex: Int?
    var exercise: Exercise? {
        didSet {
            guard let exercise = exercise else { return }
            nameLabel.text = exercise.name
            //TODO: Update
            setCollectionView.heightAnchor.constraint(equalToConstant: dynamicTableHeight).isActive = true
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
        button.setImage(UIImage(named: "infoIcon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
//    private lazy var setEditor: SetEditorView = {
//        let view = SetEditorView()
//        view.delegate = self
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    private lazy var setCollectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.backgroundColor = .white
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
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25.0),
            nameLabel.trailingAnchor.constraint(equalTo: infoButton.leadingAnchor, constant: -10.0),
            nameLabel.heightAnchor.constraint(equalToConstant: 40.0),
            
            infoButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10.0),
            infoButton.widthAnchor.constraint(equalToConstant: 25.0),
            infoButton.heightAnchor.constraint(equalToConstant: 25.0),
            infoButton.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            
//            setEditor.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10.0),
//            setEditor.widthAnchor.constraint(equalTo: self.widthAnchor),
//            setEditor.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            setEditor.bottomAnchor.constraint(equalTo: self.setCollectionView.topAnchor, constant: -10.0),
            
            setCollectionView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5.0),
            setCollectionView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.95),
            setCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25.0),
            setCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),


        ])
    }
    
    //MARK: ExerciseCell - Methods
    
    func beginEditing() {
//        setEditor.isHidden = false
//        self.editorHeight?.constant = 100.0
//        UIView.animate(withDuration: 0.25, animations: {
//            self.layoutIfNeeded()
//        }, completion: { _ in
//            self.setEditor.isHidden = true
//            if let delegate = self.delegate, let index = self.index {
//                delegate.editingStateChanged(self, editingIndex: index)
//            }
//        })
//
    }
    
    func endEditing() {
//        setSelectedIndex = nil
//        self.editorHeight?.constant = 0.0
//
//        UIView.animate(withDuration: 0.25, animations: {
//            self.layoutIfNeeded()
//        }, completion: { _ in
//            self.setEditor.isHidden = true
//            if let delegate = self.delegate {
//                delegate.editingStateChanged(self, editingIndex: nil)
//            }
//        })
       
    }
}

extension ExerciseCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        beginEditing()
//        if indexPath.row == 0 {
//            setSelectedIndex = exercise?.setCount
//            beginEditing()
//        } else {
//            setSelectedIndex = indexPath.row
//
//        }
//        self.setCollectionView.reloadData()
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
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//                
//        if indexPath.row == 0 {
//            return CGSize(width: 40.0, height: 30.0)
//        } else {
//            return CGSize(width: 100.0, height: 30.0)
//
//        }
//    }
}

extension ExerciseCell: SetEditorViewDelegate {
    func save() {
        endEditing()
    }
}
