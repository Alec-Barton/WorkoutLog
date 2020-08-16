//
//  WorkoutViewController.swift
//  WorkoutLog
//
//  Created by Alec Barton on 5/25/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import Foundation
import UIKit

class DayViewController: UIViewController {
    
    var day: Day?
    var date: Date?
    
    //TODO: this is stupid and temporary
    var toggler:[Int:Bool] = [:]
    var editingIndex: IndexPath?
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "DATE"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var workoutTableView: UITableView = {
        let view = UITableView()
        view.allowsSelection = false
        view.separatorStyle = .none
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        guard let date = date else { return }
//        
//        let formatter = DateFormatter()
//        formatter.setLocalizedDateFormatFromTemplate("MMMMd")
//        dateLabel.text = formatter.string(from: date)
        
        self.view.backgroundColor = ColorTheme.DayController.background
        workoutTableView.register(ExerciseCell.self, forCellReuseIdentifier: ExerciseCell.id)
        workoutTableView.register(ExerciseAddCell.self, forCellReuseIdentifier: ExerciseAddCell.id)
        workoutTableView.register(DescriptionCell.self, forCellReuseIdentifier: DescriptionCell.id)

        workoutTableView.dataSource = self
        workoutTableView.delegate = self
        
        workoutTableView.rowHeight = UITableView.automaticDimension
        workoutTableView.estimatedRowHeight = 600
        
        setup()
        
        self.day = Day(date: Date())
        
        //TODO: temp
        if var workout = Workout(named: "Chest Day"), var workout2 = Workout(named: "Chest Day Jr.") {
            workout.test1()
            workout2.test2()
            day?.workouts.append(contentsOf: [workout, workout2])
            workoutTableView.reloadData()

        }
        guard let workouts = day? .workouts.count else { return }
        for i in 0..<workouts {
            toggler[i] = true
        }
    }
    
    private func setup() {
        view.addSubview(dateLabel)
        view.addSubview(workoutTableView)
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20.0),
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dateLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.95),
            dateLabel.heightAnchor.constraint(equalToConstant: 30.0),
            
            workoutTableView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 50.0),
            workoutTableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0),
            workoutTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20.0),
            workoutTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
}

extension DayViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}


extension DayViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return day?.workouts.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (day?.workouts[section].exercises.count ?? 0) + 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = WorkoutHeaderView()
        view.workout = day?.workouts[section]
        view.section = section
        view.delegate = self
        return view
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return WorkoutHeaderView.height
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: DescriptionCell.id, for: indexPath) as! DescriptionCell
            return cell
        }
        
        if indexPath.row == ((day?.workouts[indexPath.section].exercises.count ?? 0) + 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseAddCell.id, for: indexPath) as! ExerciseAddCell
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ExerciseCell.id, for: indexPath) as! ExerciseCell
        cell.exercise = day?.workouts[indexPath.section].exercises[indexPath.row - 1]
        return cell
    }
}

extension DayViewController: WorkoutHeaderViewDelegate {
    func toggleOpen(_ view: WorkoutHeaderView) {
        guard let section = view.section else { return }
        guard let toggle = toggler[section] else { return }
        
        defer { workoutTableView.reloadSections(IndexSet(integer: section), with: .fade)}
        
        toggler[section] = !toggle
        
        guard toggle else { return }
        
        var indexPaths:[IndexPath] = []
        guard let workout = day?.workouts[section] else { return }
        for i in 0..<workout.exercises.count {
            indexPaths.append(IndexPath(row: i, section: section))
        }
        workoutTableView.deleteRows(at: indexPaths, with: .fade)
    }
}
