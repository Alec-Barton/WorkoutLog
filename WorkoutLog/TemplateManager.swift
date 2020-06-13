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
    
    var workoutTemplateDictionary: [String:WorkoutTemplate] = [:]
    var exerciseTemplateDictionary: [String:ExerciseTemplate] = [:]
    
    //TODO: TEMP
    func setup () {
        let benchPress = ExerciseTemplate(name: "BenchPress", type: .weighted)
        let pushup = ExerciseTemplate(name: "Pushup", type: .unweighted)
        let plank = ExerciseTemplate(name: "Plank", type: .interval)
        
        guard addTemplate(exercise: benchPress) else { print ("ERROR"); return }
        guard addTemplate(exercise: pushup) else { print ("ERROR"); return }
        guard addTemplate(exercise: plank) else { print ("ERROR"); return }
        
        let workoutData: [String:Any] = [
            "name" : "Chest Day",
            "exercises": ["BenchPress", "Pushup", "Plank"]
        ]
        
        guard let workout = WorkoutTemplate(data: workoutData) else { fatalError() }
        guard addTemplate(workout: workout) else { fatalError() }
    }
    
    func templateDoesExistFor(workout: WorkoutTemplate) -> Bool {
        return workoutTemplateDictionary[workout.name] == nil ? false : true
    }
    
    func templateDoesExistFor(exercise: ExerciseTemplate) -> Bool {
        return exerciseTemplateDictionary[exercise.name] == nil ? false : true
    }
    
    func addTemplate(workout: WorkoutTemplate) -> Bool {
        guard !templateDoesExistFor(workout: workout) else { return false }
        workoutTemplateDictionary[workout.name] = workout
        return true
    }
    
    func addTemplate(exercise: ExerciseTemplate) -> Bool {
        guard !templateDoesExistFor(exercise: exercise) else { return false }
        exerciseTemplateDictionary[exercise.name] = exercise
        return true
    }
    
    func updateTemplate(workout: WorkoutTemplate) {}
    func updateTemplate(exercise: ExerciseTemplate) {}
    
    func getTemplate(workoutNamed: String) -> WorkoutTemplate? {
        return workoutTemplateDictionary[workoutNamed]
    }
    
    func getTemplate(exerciseNamed: String) -> ExerciseTemplate? {
        return exerciseTemplateDictionary[exerciseNamed]
    }
    
}
