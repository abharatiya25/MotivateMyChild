//
//  ContentView.swift
//  MotivateMyChild
//
//  Created by Ankit Bharatiya on 9/13/23
//
import SwiftUI

struct Task: Identifiable {
    let id = UUID()
    let taskName: String
    let taskDescription: String
    let pointValue: Int
}

struct ContentView: View {
    @State private var tasks: [Task] = []
    @State private var isAddingTask = false
    @State private var selectedTask: Task? = nil
    
    var body: some View {
        NavigationView {
            List(tasks) { task in
                Text(task.taskName)
                    .onTapGesture {
                        self.selectedTask = task
                    }
            }
            .sheet(item: $selectedTask) { task in
                TaskDetailPopupView(task: task, isPresented: $selectedTask)
            }
            .navigationBarTitle("Task List")
            .navigationBarItems(leading:
                                    Button(action: {
                self.isAddingTask = true
            }) {
                Text("Add Task")
            },
                                trailing:
                                    Button(action: {
                self.isAddingTask = true
            }) {
                Image(systemName: "plus")
            }
            )
        }
        .sheet(isPresented: $isAddingTask) {
            // Display the AddTaskView when isAddingTask is true
            AddTaskView(isAddingTask: $isAddingTask, tasks: $tasks)
        }
    }
}

struct AddTaskView: View {
    @Binding var isAddingTask: Bool
    @Binding var tasks: [Task]
    
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
                        tasks.append(newTask)
                        
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
            
            //      Spacer()
            
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



