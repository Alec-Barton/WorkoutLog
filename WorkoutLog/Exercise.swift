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
    case weighted (Repetitions, Weight)
    case unweighted (Repetitions)
    case timed (Interval)
}

class Exercise {
    var name: String
    var type: ExerciseType
    
//  var muscleGroup
    
    init (name: String, type: ExerciseType) {
        self.name = name
        self.type = type
    }
}
