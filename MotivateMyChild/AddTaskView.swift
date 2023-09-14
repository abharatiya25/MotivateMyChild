import SwiftUI
struct AddTaskView: View {
    @Binding var isAddingTask: Bool
    @ObservedObject var taskData: TaskData
    
    // Properties to store the task details
    @State private var taskName = ""
    @State private var taskDescription = ""
    @State private var pointValue: Float = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Task Details")) {
                    // Task Name
                    TextField("Task Name", text: $taskName)
                    
                    // Task Description
                    TextField("Task Description", text: $taskDescription)
                }
                
                Section(header: Text("Point Value")) {
                    // Point Value Slider
                    Slider(value: $pointValue, in: 0...10, step: 1)
                    Text("Points: \(Int(pointValue))")
                        .padding()
                }
                
                Section {
                    // Save Button
                    Button(action: {
                        // Create a Task instance and append it to the tasks array
                        let newTask = Task(taskName: taskName, taskDescription: taskDescription, pointValue: Int(pointValue))
                        taskData.tasks.append(newTask)
                        
                        // Save tasks to the Document Directory
                        taskData.saveTasks()
                        // taskData.saveTotalPoints()
                        
                        // Dismiss the task adding view
                        isAddingTask = false
                    }) {
                        Text("Save Task")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                }
            }
            .navigationTitle("Add Task")
            .navigationBarItems(trailing:
                                    Button(action: {
                // Close the AddTaskView
                isAddingTask = false
            }) {
                Text("Cancel")
            }
            )
        }
    }
}
