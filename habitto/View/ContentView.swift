import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()

    var body: some View {
        VStack {
            Spacer()

            // Show the selected screen
            Group {
                switch viewModel.selectedScreen {
                case .habits:
                    HabitsView()
                case .progress:
                    ProgressViewScreen()
                case .settings:
                    SettingsView()
                }
            }
            .frame(maxHeight: .infinity)

            // Bottom Navigation Bar
            HStack {
                Button(action: { viewModel.selectedScreen = .habits }) {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("Habits")
                    }
                }
                .frame(maxWidth: .infinity)

                Button(action: { viewModel.selectedScreen = .progress }) {
                    VStack {
                        Image(systemName: "chart.bar.fill")
                        Text("Progress")
                    }
                }
                .frame(maxWidth: .infinity)

                Button(action: { viewModel.selectedScreen = .settings }) {
                    VStack {
                        Image(systemName: "gearshape.fill")
                        Text("Settings")
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .background(Color.gray.opacity(0.2))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
