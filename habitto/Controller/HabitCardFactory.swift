//
//  HabitCardFactory.swift
//  habitto
//
//  Created by K Praneeth on 2/4/

import SwiftUI

class HabitCardFactory {
    static func createCard(habit: Habit) -> AnyView {
        switch habit.category {
        case "Work":
            return AnyView(WorkHabitCard(habit: habit))
        case "Health":
            return AnyView(HealthHabitCard(habit: habit))
        case "Personal Growth":
            return AnyView(PersonalGrowthHabitCard(habit: habit))
        case "Hobbies":
            return AnyView(HobbiesHabitCard(habit: habit))
        default:
            return AnyView(OtherHabitCard(habit: habit))  // Default case
        }
    }
}
