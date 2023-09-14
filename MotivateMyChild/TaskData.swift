//
//  TaskData.swift
//  MotivateMyChild
//
//  Created by Ankit Bharatiya on 9/20/23.
//

import Foundation
import SwiftUI

class TaskData: ObservableObject {
    @Published var tasks: [Task] = []
    @Published var totalPoints = 0
    
    private var dataFilePath: URL {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent("tasks.plist")
    }
    init() {
        loadTasks()
        loadTotalPoints()
    }
    // Function to toggle task completion
    func toggleTaskCompletion(task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            if tasks[index].isCompleted {
                totalPoints -= tasks[index].pointValue // Reduce total points when unmarking as completed
            } else {
                totalPoints += tasks[index].pointValue // Increase total points when marking as completed
            }
            
            tasks[index].isCompleted.toggle()
            saveTasks()
            //   saveTotalPoints()
        }
    }
    
    // Function to save tasks to the Document Directory
    func saveTasks() {
        do {
            let encoder = PropertyListEncoder()
            let tasksData = try encoder.encode(tasks)
            try tasksData.write(to: dataFilePath)
        } catch {
            print("Error encoding tasks data: \(error)")
        }
    }
    // Function to save total points to UserDefaults
    //        func saveTotalPoints() {
    //            UserDefaults.standard.set(totalPoints, forKey: "TotalPoints")
    //        }
    
    // Function to calculate total points based on the current state of tasks
    func loadTotalPoints() {
        
        totalPoints = tasks.reduce(0) { $0 + ($1.isCompleted ? $1.pointValue : 0) }
    }
    
    
    // Function to load tasks from the Document Directory
    func loadTasks() {
        if let data = try? Data(contentsOf: dataFilePath) {
            let decoder = PropertyListDecoder()
            do {
                let loadedTasks = try decoder.decode([Task].self, from: data)
                tasks = loadedTasks
                //  totalPoints = tasks.reduce(0) { $0 + $1.pointValue }
            } catch {
                print("Error decoding tasks data: \(error)")
            }
        }
    }
}
