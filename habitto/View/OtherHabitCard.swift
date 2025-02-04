//
//  OtherHabitCard.swift
//  habitto
//
//  Created by K Praneeth on 2/4/25.
//

import SwiftUI

struct OtherHabitCard: View {
    var habit: Habit

    var body: some View {
        VStack {
            Text(habit.name)
                .font(.headline)
                .padding()
            Text("Other Habit")
                .font(.subheadline)
                .foregroundColor(.gray)
            Image(systemName: "star.fill")
                .font(.largeTitle)
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
                .padding(.vertical, 8) // Reduced vertical padding
                .frame(maxWidth: .infinity)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
                .shadow(radius: 5)
    }
}
