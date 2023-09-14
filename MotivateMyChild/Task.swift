//
//  Task.swift
//  MotivateMyChild
//
//  Created by Ankit Bharatiya on 9/20/23.
//

import Foundation
import SwiftUI

struct Task: Identifiable, Codable {
    let id = UUID()
    var taskName: String
    var taskDescription: String
    var pointValue: Int
    var isCompleted: Bool = false
}
