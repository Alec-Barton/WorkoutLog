//
//  Workout.swift
//  WorkoutLog
//
//  Created by Alec Barton on 5/24/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import Foundation
import UIKit

class WorkoutInstance {
    var date: Date
    var name: String
    var description: String
    var type: WorkoutTemplate?
    var exercises: [ExerciseInstance]
    
    init (workout: WorkoutTemplate?) {
        //TODO: dynamic date
        self.date = Date()
        self.exercises = []
        
        if let workout = workout {
            self.name = workout.name
            self.description = ""
            self.type = workout
            self.exercises = []
            for exercise in workout.exercises {
                print(exercise.name)
                let b = TemplateManager.shared.exerciseTemplateDictionary
                if let instance = ExerciseInstance(name: exercise.name) {
                    exercises.append(instance)
                }
            }
        } else {
            self.name = ""
            self.description = ""
            self.type = nil
        }
    }
    
    convenience init () {
        self.init(workout: nil)
    }
}

class WorkoutTemplate {
    public var name: String
    var exercises: [ExerciseTemplate]
    var color: UIColor = .blue
    
    init? (data: [String: Any]) {
        guard let name = data["name"] as? String else { return nil }
        guard let exerciseNames = data["exercises"] as? [String] else { return nil }
        self.name = name
        self.exercises = []
        for name in exerciseNames {
            if let exercise = TemplateManager.shared.getTemplate(exerciseNamed: name){
                exercises.append(exercise)
            }
        }
    }
    
}
