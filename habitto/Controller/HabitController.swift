//
//  HabitController.swift
//  habitto
//
//  Created by K Praneeth on 2/2/25.
//

import Foundation

class HabitController: ObservableObject {
    @Published var habits: [Habit] = []
    
    func addHabit(_ habit: Habit) {
        habits.append(habit)
    }
}
