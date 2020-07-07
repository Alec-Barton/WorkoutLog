//
//  WorkoutCell.swift
//  WorkoutLog
//
//  Created by Alec Barton on 6/14/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

//import UIKit
//
//class WorkoutCell: UITableViewCell {
//    static let id = "WorkoutCellId"
//    
//    var workout: Workout?
//    var editingIndex: Int?
//    
//    private lazy var workoutLabel: UILabel = {
//        let label = UILabel()
//        label.text = "WORKOUT"
//        label.textAlignment = .center
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    private lazy var exerciseTableView : FlexTableView = {
//        let view = FlexTableView()
//        view.allowsSelection = false
//        view.backgroundColor = .yellow
//        view.rowHeight = UITableView.automaticDimension
//        view.estimatedRowHeight = 100
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        self.backgroundColor = .white
//        
//        exerciseTableView.delegate = self
//        exerciseTableView.dataSource = self
//        exerciseTableView.register(ExerciseCell.self, forCellReuseIdentifier: ExerciseCell.id)
//        
//        setup()
//    }
//    
//    private func setup() {
//        addSubview(workoutLabel)
//        addSubview(exerciseTableView)
//        
//        NSLayoutConstraint.activate([
//            workoutLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20.0),
//            workoutLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            workoutLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.95),
//            workoutLabel.heightAnchor.constraint(equalToConstant: 30.0),
//            
//            exerciseTableView.topAnchor.constraint(equalTo: workoutLabel.bottomAnchor, constant: 50.0),
//            exerciseTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
//            exerciseTableView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.95),
//            exerciseTableView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
//            
////            exerciseTableView.heightAnchor.constraint(equalToConstant: 300.0)
//        ])
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }
//}
//
//extension WorkoutCell: UITableViewDelegate {
//    //disabled
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("")
//    }
//}
//
//extension WorkoutCell: UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        guard let workout = workout else { return 0 }
//        return workout.exercises.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseCell.id, for: indexPath) as! ExerciseCell
//        cell.exercise = workout?.exercises[indexPath.row]
//        cell.setSelectedIndex = nil
//        cell.exerciseIndex = indexPath.row
//        cell.delegate = self
//        if indexPath.row%2 == 0 {
//            cell.backgroundColor = .purple
//        } else {
//            cell.backgroundColor = .orange
//        }
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200.0
//        //TODO: this is very jenky
////        var exerciseSets = workout?.exercises[indexPath.row].sets.count ?? 0
////        exerciseSets = exerciseSets == 0 ? 1 : exerciseSets
////        let rows: Int = exerciseSets / 3 + 1
////        let offset: Int = ((exerciseSets + 1) % 3 == 0) ? 1 : 0
////        var size = CGFloat(60.0 + Double(rows + offset) * 50 )
////        if indexPath.row == editingIndex {
////            size += 100
////        }
////        return size
//    }
//}
//

//
