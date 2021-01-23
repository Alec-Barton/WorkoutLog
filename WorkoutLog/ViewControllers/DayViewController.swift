//
//  WorkoutViewController.swift
//  WorkoutLog
//
//  Created by Alec Barton on 5/25/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

class DayViewController: UICollectionViewController {
    
    let padding: CGFloat = 30
    let day = DayModel()
    
    var isEditingDay: Bool? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    private lazy var titleView: DayTitleView = {
        let view = DayTitleView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    convenience init() {
        let layout = UICollectionViewFlowLayout()
        self.init(collectionViewLayout: layout)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setup()
        registerIds()
        isEditingDay = true
    }
    
    private func setup() {
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = .init(top: 0, left: 0, bottom: 30.0, right: 0)
        }
        
        view.backgroundColor = ColorTheme.lightGray1
        collectionView.backgroundColor = ColorTheme.lightGray1
        collectionView.contentInsetAdjustmentBehavior = .never
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(titleView)

        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: view.safeAreaTopAnchor, constant: 20.0),
            titleView.heightAnchor.constraint(equalToConstant: 70.0),
            titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            
            collectionView.topAnchor.constraint(equalTo: titleView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaBottomAnchor, constant: -30.0),
        ])
    }
    
    private func registerIds () {
        collectionView.register(WorkoutHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: WorkoutHeaderView.id)
        collectionView.register(AddWorkoutHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AddWorkoutHeaderView.id)

        collectionView.register(ExerciseCollectionCell.self, forCellWithReuseIdentifier: ExerciseCollectionCell.id)
        collectionView.register(AddExerciseCollectionCell.self, forCellWithReuseIdentifier: AddExerciseCollectionCell.id)
    }
    
}

extension DayViewController: UICollectionViewDelegateFlowLayout {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        //TODO: Extra cell for editing
        return day.workoutArray.count + ((isEditingDay ?? false) ? 1 : 0 )
    }
        
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if (isEditingDay ?? false) && indexPath.section == day.workoutArray.count {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AddWorkoutHeaderView.id, for: indexPath) as! AddWorkoutHeaderView
            return header
        }
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: WorkoutHeaderView.id, for: indexPath) as! WorkoutHeaderView
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 50.0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (isEditingDay ?? false) && section == day.workoutArray.count { return 0 }
        return day.workoutArray[section].exerciseArray.count + ((isEditingDay ?? false) ? 1 : 0 )
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if (isEditingDay ?? false) && indexPath.row == day.workoutArray[indexPath.section].exerciseArray.count {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddExerciseCollectionCell.id, for: indexPath) as! AddExerciseCollectionCell
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExerciseCollectionCell.id, for: indexPath) as! ExerciseCollectionCell
        cell.exercise = day.workoutArray[indexPath.section].exerciseArray[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (isEditingDay ?? false) && indexPath.row == day.workoutArray[indexPath.section].exerciseArray.count {
            return CGSize(width: UIScreen.main.bounds.width, height: 35.0)
        }
        let workout = day.workoutArray[indexPath.section]
        let exercise = workout.exerciseArray[indexPath.row]
        return ExerciseCollectionCell.sizeFor(exercise)
    }
}

extension DayViewController: ExerciseCollectionCellDelegate {
    func openSetEditorFor(_ cell: ExerciseCollectionCell) {
        let controller = EditorViewController()
        self.present(controller, animated: true)
    }
}
