import SwiftUI

struct HabitDetailView: View {
    var habit: Habit
    var controller: HabitController
    @State private var isEditing = false
    @State private var filteredPastDates: [String] = []
    @State private var filteredFutureDates: [String] = []
    @State private var clickCounters: [String: Int] = [:] // Stores click count for each date
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        Text(habit.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Text("Category: \(habit.category)")
                            .font(.title3)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("Frequency: \(habit.frequency) times/day")
                            .font(.title3)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        Text("Days: \(habit.days.joined(separator: ", "))")
                            .font(.title3)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        // Displaying past completed dates
                        Text("Completed on (Past):")
                            .font(.title3)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)

                        ForEach(filteredPastDates, id: \.self) { date in
                            Button(action: {
                                clickCounters[date, default: 0] += 1
                            }) {
                                HStack {
                                    Text(date)
                                        .foregroundColor(.blue)
                                    Spacer()
                                    Text("\(clickCounters[date, default: 0])")
                                        .font(.body)
                                        .foregroundColor(.black)
                                        .padding(.trailing, 10)
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue.opacity(0.2))
                                .cornerRadius(8)
                            }
                        }

                        // Displaying future planned dates
                        Text("Planned for Next 21 Days:")
                            .font(.title3)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)

                        ForEach(filteredFutureDates, id: \.self) { date in
                            Button(action: {
                                clickCounters[date, default: 0] += 1
                            }) {
                                HStack {
                                    Text(date)
                                        .foregroundColor(.green)
                                    Spacer()
                                    Text("\(clickCounters[date, default: 0])")
                                        .font(.body)
                                        .foregroundColor(.black)
                                        .padding(.trailing, 10)
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.green.opacity(0.2))
                                .cornerRadius(8)
                            }
                        }
                    }
                    .padding()
                    .frame(width: geometry.size.width)
                }
                
                // Edit Habit Button (Fixed at the bottom)
                Button("Edit Habit") {
                    isEditing = true
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding([.leading, .trailing, .bottom], 20)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .navigationTitle("Habit Details")
        .onAppear {
                   // Fetch filtered dates
                   filteredPastDates = controller.getFilteredHabitDates(habit: habit, isFuture: false)
                   filteredFutureDates = controller.getFilteredHabitDates(habit: habit, isFuture: true)
               }
        .sheet(isPresented: $isEditing) {
            EditHabitView(habit: habit, controller: controller)
        }
    }
}
