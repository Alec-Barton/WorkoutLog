//
//  Exercise.swift
//  WorkoutLog
//
//  Created by Alec Barton on 5/24/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import Foundation

typealias Weight = Int
typealias Repetitions = Int
typealias Interval = Int

enum ExerciseType {
    case weighted //(Repetitions, Weight)
    case unweighted //(Repetitions)
    case interval //(Interval)
}

class ExerciseInstance {
    var name: String
    var exercise: ExerciseTemplate
    var sets: [ExerciseSet]
    
    init? (name: String) {
        self.name = name
        guard let exercise = ExerciseDictionary().lookup(exercise: name) else { return nil }
        self.exercise = exercise
        self.sets = []
    }
    
    func log(set: ExerciseSet) {
        sets.append(set)
    }
}

class ExerciseTemplate {
    var name: String
    var type: ExerciseType
    
    init (name: String, type: ExerciseType){
        self.name = name
        self.type = type
    }
}

class ExerciseSet {
    var reps: ExerciseType
    
    init (reps: ExerciseType) {
        self.reps = reps
    }
}

class ExerciseDictionary {
    private static var dictionary: [String:ExerciseTemplate] = [:]
    
    public func lookup (exercise exerciseName: String) -> ExerciseTemplate? {
        return ExerciseDictionary.dictionary[exerciseName]
    }
    
    public func add (exercise: ExerciseTemplate) -> Bool {
        if ExerciseDictionary.dictionary[exercise.name] == nil {
            ExerciseDictionary.dictionary[exercise.name] = exercise
            return true
        }
        return false
    }
    
    public func edit (exercise: ExerciseTemplate) {}
}
