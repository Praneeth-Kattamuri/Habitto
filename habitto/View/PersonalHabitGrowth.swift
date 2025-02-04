//
//  PersonalHabitGrowth.swift
//  habitto
//
//  Created by K Praneeth on 2/4/25.
//

import SwiftUI

struct PersonalGrowthHabitCard: View {
    var habit: Habit

    var body: some View {
        VStack {
            Text(habit.name)
                .font(.headline)
                .padding()
            Text("Personal Growth Habit")
                .font(.subheadline)
                .foregroundColor(.gray)
            Image(systemName: "book.fill")
                .font(.largeTitle)
                .foregroundColor(.purple)
        }
        .padding(.horizontal)
                .padding(.vertical, 8) // Reduced vertical padding
                .frame(maxWidth: .infinity)
                .background(Color.purple.opacity(0.1))
                .cornerRadius(10)
                .shadow(radius: 5)
    }
}
