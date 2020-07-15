//
//  Workout.swift
//  WorkoutLog
//
//  Created by Alec Barton on 5/24/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import Foundation
import UIKit

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
