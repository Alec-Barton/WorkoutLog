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
    case weighted
    case unweighted
    case interval
}

enum ExerciseSet {
    case weighted (Repetitions? = nil, Weight? = nil)
    case unweighted (Repetitions? = nil)
    case interval (Interval? = nil)
    
    var string: String {
        return "135lbs x 10"
    }
}

class Exercise {
    var name: String
    var type: ExerciseType
    var sets: [ExerciseSet]
    
    var isTemplate: Bool {
        return sets.isEmpty
    }
    
    init (name: String, type: ExerciseType){
        self.name = name
        self.type = type
        self.sets = []
    }
    
    convenience init? (named name: String) {
        guard let exercise = TemplateManager.shared.get(exerciseNamed: name) else { return nil }
        self.init(name: exercise.name, type: exercise.type)
    }
    
    func log(set: ExerciseSet) {
        sets.append(set)
    }
}

//class ExerciseTemplate {
//    var name: String
//    var type: ExerciseType
//
//    init (name: String, type: ExerciseType){
//        self.name = name
//        self.type = type
//    }
//}

//class ExerciseSet {
//    var reps: ExerciseType
//
//    init (reps: ExerciseType) {
//        self.reps = reps
//    }
//
//    var string: String {
//        return "135lbs x 10"
//    }
//}

//class ExerciseDictionary {
//    private static var dictionary: [String:ExerciseTemplate] = [:]
//
//    public func lookup (exercise exerciseName: String) -> ExerciseTemplate? {
//        return ExerciseDictionary.dictionary[exerciseName]
//    }
//
//    public func add (exercise: ExerciseTemplate) -> Bool {
//        if ExerciseDictionary.dictionary[exercise.name] == nil {
//            ExerciseDictionary.dictionary[exercise.name] = exercise
//            return true
//        }
//        return false
//    }
//
//    public func edit (exercise: ExerciseTemplate) {}
//}
