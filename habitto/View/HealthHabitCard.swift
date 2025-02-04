//
//  HealthHabitCard.swift
//  habitto
//
//  Created by K Praneeth on 2/4/25.
//

import SwiftUI

struct HealthHabitCard: View {
    var habit: Habit

    var body: some View {
        VStack {
            Text(habit.name)
                .font(.headline)
                .padding()
            Text("Health Habit")
                .font(.subheadline)
                .foregroundColor(.gray)
            Image(systemName: "heart.fill")
                .font(.largeTitle)
                .foregroundColor(.red)
        }
        .padding(.horizontal) // Reduce padding
                .padding(.vertical, 8) // Reduce vertical padding to make the card shorter
                .frame(maxWidth: .infinity) // Expand to fill horizontal space
                .background(Color.green.opacity(0.1))
                .cornerRadius(10)
                .shadow(radius: 5)
    }
}
