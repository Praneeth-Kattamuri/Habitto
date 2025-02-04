//
//  HobbiesHabitCard.swift
//  habitto
//
//  Created by K Praneeth on 2/4/25.
//

import SwiftUI

struct HobbiesHabitCard: View {
    var habit: Habit

    var body: some View {
        VStack {
            Text(habit.name)
                .font(.headline)
                .padding()
            Text("Hobby Habit")
                .font(.subheadline)
                .foregroundColor(.gray)
            Image(systemName: "paintbrush.fill")
                .font(.largeTitle)
                .foregroundColor(.green)
        }
        .padding(.horizontal)
                .padding(.vertical, 8) // Reduced vertical padding
                .frame(maxWidth: .infinity)
                .background(Color.orange.opacity(0.1))
                .cornerRadius(10)
                .shadow(radius: 5)
    }
}
