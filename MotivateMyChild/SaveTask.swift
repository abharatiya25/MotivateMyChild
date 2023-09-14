////
////  SaveTask.swift
////  MotivateMyChild
////
////  Created by Ankit Bharatiya on 9/13/23
////
//
//import Foundation
//
//import SwiftUI
//
//struct Task: Identifiable {
//    let id = UUID()
//    let taskName: String
//    let taskDescription: String
//    let pointValue: Int
//}
//
//struct TaskListView: View {
//    @State private var tasks: [Task] = [] // This array will store the tasks
//    @State private var isAddingTask = false // A flag to control the task adding view
//    @State private var selectedTask: Task? = nil // Add a selectedTask property
//
//
//    var body: some View {
//        NavigationView {
//            List(tasks) { task in
//                // Display a list of tasks here
//                Text(task.taskName)
//                   .onTapGesture {
//                       self.selectedTask = task
//                   }
//            }
//            .sheet(isPresented: $isAddingTask) {
//                // Pass the binding properties to the task adding view
//                AddTaskView(isAddingTask: $isAddingTask, tasks: $tasks)
//            }
////            .sheet(item: $selectedTask) { task in
////                TaskDetailPopupView(taskName: task, isPresented: $selectedTask)
////                        }
//            .navigationBarTitle("Task List")
//            .navigationBarItems(trailing:
//                Button(action: {
//                    // Show the task adding view
//                    self.isAddingTask = true
//                }) {
//                    Image(systemName: "plus")
//                }
//            )
//        }
//    }
//    }
//
//    struct AddTaskView: View {
//        @Binding var isAddingTask: Bool
//        @Binding var tasks: [Task]
//        // Properties to store the task details
//        @State private var taskName = ""
//        @State private var taskDescription = ""
//        @State private var pointValue: Double = 0
//        var body: some View {
//            NavigationView {
//                Form {
//                    Section(header: Text("Task Details")) {
//                        TextField("Task Name", text: $taskName)
//                        TextField("Task Description", text: $taskDescription)
//                    }
//                    Section(header: Text("Point Value")) {
//                        // Point Value Slider
//                        Slider(value: $pointValue, in: 0...10, step: 1)
//                        Text("Points: \(pointValue)")
//                            .padding()
//                    }
//                    Section {
//                        Button(action: {
//                            let newTask = Task(taskName: taskName, taskDescription: taskDescription, pointValue: Int(pointValue))
//                            tasks.append(newTask)
//                            // Dismiss the task adding view
//                            isAddingTask = false
//                        }) {
//                            Text("Save Task")
//                                .foregroundColor(.white)
//                                .frame(maxWidth: .infinity, minHeight: 44)
//                                .background(Color.blue)
//                                .cornerRadius(8)
//                        }
//                    }
//                }
//                .navigationTitle("Add Task")
//            }
//        }
//}
