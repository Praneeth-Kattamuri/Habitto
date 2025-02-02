//
//  Habit.swift
//  habitto
//
//  Created by K Praneeth on 2/2/25.
//

import Foundation

struct Habit: Identifiable {
    let id = UUID()
    var name: String
    var category: String
    var days: [String]
    var frequency: Int
    var time: Date
}
