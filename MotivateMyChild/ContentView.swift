import SwiftUI

struct ContentView: View {
    @StateObject private var taskData = TaskData()
    @State private var isAddingTask = false
    @State private var selectedTask: Task? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Total Points: \(taskData.totalPoints)")
                    .font(.headline)
                    .padding()
                
                List {
                    ForEach(taskData.tasks) { task in
                        HStack {
                            Button(action: {
                                taskData.toggleTaskCompletion(task: task)
                            }) {
                                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(task.isCompleted ? .green : .gray)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                            
                            Text(task.taskName)
                                .onTapGesture {
                                    self.selectedTask = task
                                }
                        }
                    }
                    .onDelete { indexSet in
                        // Remove completed tasks and update total points
                        for index in indexSet {
                            if taskData.tasks[index].isCompleted {
                                taskData.totalPoints -= taskData.tasks[index].pointValue
                            }
                        }
                        taskData.tasks.remove(atOffsets: indexSet)
                        taskData.saveTasks()
                        //           taskData.saveTotalPoints()
                    }
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
            AddTaskView(isAddingTask: $isAddingTask, taskData: taskData)
        }
    }
}






