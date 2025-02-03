import SwiftUI

struct HabitDetailView: View {
    var habit: Habit
    var controller: HabitController
    @State private var isEditing = false
    @State private var filteredPastDates: [String] = []
    @State private var filteredFutureDates: [String] = []
    
    var body: some View {
        VStack {
            // ScrollView to make content scrollable
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    Text(habit.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)

                    Text("Category: \(habit.category)")
                        .font(.title3)
                        .foregroundColor(.gray)
                    
                    Text("Frequency: \(habit.frequency) times/day")
                        .font(.title3)

                    Text("Days: \(habit.days.joined(separator: ", "))")
                        .font(.title3)

                    // Displaying past completed dates
                    Text("Completed on (Past):")
                        .font(.title3)
                        .bold()
                    
                    ForEach(filteredPastDates, id: \.self) { date in
                        Text(date)
                            .font(.body)
                            .foregroundColor(.blue)
                    }

                    // Displaying future planned dates
                    Text("Planned for Next 21 Days:")
                        .font(.title3)
                        .bold()
                    
                    ForEach(filteredFutureDates, id: \.self) { date in
                        Text(date)
                            .font(.body)
                            .foregroundColor(.green)
                    }
                }
                .padding()
            }
            
            // Spacer to push the button to the bottom
            Spacer()
            
            // Edit Habit Button (Fixed at the bottom)
            Button("Edit Habit") {
                isEditing = true
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding([.leading, .trailing], 20)
        }
        .navigationTitle("Habit Details")
        .onAppear {
            // Call the function to get both past and future filtered dates
            filteredPastDates = controller.getHabitDates(habit: habit, isFuture: false)
            filteredFutureDates = controller.getHabitDates(habit: habit, isFuture: true)
        }
        .sheet(isPresented: $isEditing) {
            // Presenting the EditHabitView to edit the habit
            EditHabitView(habit: habit, controller: controller)
        }
    }
}
