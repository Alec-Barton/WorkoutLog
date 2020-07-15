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
    case weighted (Repetitions, Weight)
    case unweighted (Repetitions)
    case interval (Interval)
    
    var string: String {
        switch self {
        case .weighted(let reps, let weight):
//            guard let reps = reps, let weight = weight else { return "ERROR" }
            return "\(reps) X \(weight)lbs"
        case .unweighted(let reps):
//            guard let reps = reps else { return "ERROR" }
            return "\(reps)"
        case .interval(let interval):
//            guard let interval = interval else { return "ERROR" }
            //TODO: Time formatting
            return "\(interval) s"
        }
    }
}

struct Exercise {
    var name: String
    var type: ExerciseType
    var sets: [ExerciseSet]
    
    var isTemplate: Bool {
        return sets.isEmpty
    }
    
    var setCount: Int {
        return sets.count
    }
    
    init (name: String, type: ExerciseType){
        self.name = name
        self.type = type
        self.sets = []
    }
    
    init? (named name: String) {
        guard let exercise = TemplateManager.shared.get(exerciseNamed: name) else { return nil }
        self.init(name: exercise.name, type: exercise.type)
    }
    
    mutating func log(set: ExerciseSet) {
        self.sets.append(set)
    }
    
    mutating func log(sets: [ExerciseSet]){
        self.sets.append(contentsOf: sets)
    }
}
