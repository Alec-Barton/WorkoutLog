//
//  TestObjects.swift
//  WorkoutLog
//
//  Created by Alec Barton on 12/22/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import Foundation

//Temp Data Models
class DayModel {
    var date: String = "Day 1"
    var workoutArray: [WorkoutModel] = [WorkoutModel(), WorkoutModel(), WorkoutModel()]
}

class WorkoutModel {
    var name: String = "Workout"
    var exerciseArray: [ExerciseModel] = [ExerciseModel(), ExerciseModel()]
}

class ExerciseModel {
    var name: String = "Exercise"
    var setArray: [SetModel] = [SetModel(), SetModel(), SetModel(), SetModel(), SetModel()]
}

class SetModel {
    var label: String = "10 x 120lb"
}
