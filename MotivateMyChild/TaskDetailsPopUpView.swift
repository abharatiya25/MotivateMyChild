import SwiftUI
struct TaskDetailPopupView: View {
    let task: Task
    @Binding var isPresented: Task?

    var body: some View {
        // Display task details in the popup
        VStack {
            Text("Task Details")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 20)

            Text("Name: \(task.taskName)")
                .font(.headline)
                .padding(.bottom, 10)

            Text("Description: \(task.taskDescription)")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.bottom, 10)

            Text("Points: \(task.pointValue)")
                .font(.headline)

            Spacer()

            Button(action: {
                // Close the popup by setting isPresented to nil
                self.isPresented = nil
            }) {
                Text("Close")
                    .font(.headline)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
        .background(Color.white)
        .cornerRadius(20)
        .padding(.horizontal, 20)
    }
}

