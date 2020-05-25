//
//  Workout.swift
//  WorkoutLog
//
//  Created by Alec Barton on 5/24/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import Foundation
import UIKit

class WorkoutActivity {
    var date: Date
    var name: String
    var description: String
    var type: WorkoutTemplate
    var exercises: [ExerciseActivity]
    
    init (workout: WorkoutTemplate) {
        self.date = Date()
        self.name = workout.name
        self.description = ""
        self.type = workout
        self.exercises = []
    }
}

class WorkoutTemplate {
    var name: String
    var exercises: [ExerciseTemplate]
    var color: UIColor = .blue
    
    init () {
        self.name = ""
        self.exercises = []
    }
    
}

class WorkoutDictionary {
    
}
