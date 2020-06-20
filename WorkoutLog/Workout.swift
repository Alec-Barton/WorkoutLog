//
//  Workout.swift
//  WorkoutLog
//
//  Created by Alec Barton on 5/24/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import Foundation
import UIKit

//class WorkoutInstance {
//    var date: Date
//    var name: String
//    var description: String
//    var type: WorkoutTemplate?
//    var exercises: [ExerciseInstance]
//    
//    init (workout: WorkoutTemplate?) {
//        //TODO: dynamic date
//        self.date = Date()
//        self.exercises = []
//        
//        if let workout = workout {
//            self.name = workout.name
//            self.description = ""
//            self.type = workout
//            self.exercises = []
//            for exercise in workout.exercises {
//                print(exercise.name)
//                let b = TemplateManager.shared.exerciseTemplateDictionary
//                if let instance = ExerciseInstance(name: exercise.name) {
//                    exercises.append(instance)
//                }
//            }
//        } else {
//            self.name = ""
//            self.description = ""
//            self.type = nil
//        }
//    }
//    
//    convenience init () {
//        self.init(workout: nil)
//    }
//}
//
//class WorkoutTemplate {
//    public var name: String
//    var exercises: [ExerciseTemplate]
//    var color: UIColor = .blue
//    
//    init? (data: [String: Any]) {
//        guard let name = data["name"] as? String else { return nil }
//        guard let exerciseNames = data["exercises"] as? [String] else { return nil }
//        self.name = name
//        self.exercises = []
//        for name in exerciseNames {
//            if let exercise = TemplateManager.shared.getTemplate(exerciseNamed: name){
//                exercises.append(exercise)
//            }
//        }
//    }
//    
//}

struct Workout {
    var date: Date?
    var name: String
    var description: String = ""
    var exercises: [Exercise]
    
    init (name: String, exercises: [Exercise]) {
        self.name = name
        self.exercises = exercises
    }
    
    init? (named name: String) {
        guard let workout = TemplateManager.shared.get(workoutNamed: name) else { return nil }
        self.init(name: workout.name, exercises: workout.exercises)
    }
    
    //TODO: temp
    mutating func test1(){
        exercises[0].log(sets: [.weighted(10, 135), .weighted(8, 155)])
        exercises[1].log(sets: [.unweighted(100), .unweighted(50), .unweighted(100), .unweighted(100), .unweighted(50), .unweighted(100)])
        exercises[2].log(sets: [.interval(30), .interval(60), .interval(90)])
    }
    
    mutating func test2(){
        exercises[0].log(sets: [.weighted(12, 145), .weighted(8, 145)])
        exercises[1].log(sets: [.unweighted(150), .unweighted(600), .unweighted(10), .unweighted(1), .unweighted(50), .unweighted(100)])
        exercises[2].log(sets: [.interval(70), .interval(60), .interval(90)])
    }
    
}
