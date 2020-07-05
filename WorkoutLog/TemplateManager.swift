//
//  WorkoutManager.swift
//  WorkoutLog
//
//  Created by Alec Barton on 6/13/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import Foundation

class TemplateManager {
    static let shared = TemplateManager()
    
    var workoutDictionary: [String:Workout] = [:]
    var exerciseDictionary: [String:Exercise] = [:]
    
    //TODO: TEMP
    func setup () {
        let benchPress = Exercise(name: "BenchPress", type: .weighted)
        let pushup = Exercise(name: "Pushup", type: .unweighted)
        let plank = Exercise(name: "Plank", type: .interval)

        guard add(exercise: benchPress) else { print ("ERROR"); return }
        guard add(exercise: pushup) else { print ("ERROR"); return }
        guard add(exercise: plank) else { print ("ERROR"); return }

        let exercises = [benchPress, pushup, plank]

        let workout = Workout(name: "Chest Day", exercises: exercises)
        let workout2 = Workout(name: "Chest Day Jr.", exercises: exercises)
        guard add(workout: workout) else { print ("ERROR"); return }
        guard add(workout: workout2) else { print ("ERROR"); return }
    }
    
    private func templateDoesExistFor(workout: Workout) -> Bool {
        return workoutDictionary[workout.name] == nil ? false : true
    }

    private func templateDoesExistFor(exercise: Exercise) -> Bool {
        return exerciseDictionary[exercise.name] == nil ? false : true
    }

    func add(workout: Workout) -> Bool {
        guard !templateDoesExistFor(workout: workout) else { return false }
        workoutDictionary[workout.name] = workout
        return true
    }

    func add(exercise: Exercise) -> Bool {
        guard !templateDoesExistFor(exercise: exercise) else { return false }
        exerciseDictionary[exercise.name] = exercise
        return true
    }

    func update(workout: Workout) {}
    func update(exercise: Exercise) {}
    
    func get(workoutNamed: String) -> Workout? {
        return workoutDictionary[workoutNamed]
    }
    
    func get(exerciseNamed: String) -> Exercise? {
        return exerciseDictionary[exerciseNamed]
    }
    
}
