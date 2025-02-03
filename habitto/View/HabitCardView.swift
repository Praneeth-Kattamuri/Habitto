//
//  HabitCardView.swift
//  habitto
//
//  Created by K Praneeth on 2/3/25.
//

import SwiftUI

struct HabitCardView: View {
    var habit: Habit

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(habit.name)
                .font(.headline)
                .foregroundColor(.white)
            
            Text("Category: \(habit.category)")
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.8))

        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.blue)
                .shadow(radius: 3)
        )
    }
}
