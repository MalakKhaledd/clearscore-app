//
//  CoachingSummary.swift
//  ClearScore
//
//  Created by Malak Badawy on 14/11/2023.
//

import Foundation

struct CoachingSummary: Codable {
    let activeTodo: Bool
    let activeChat: Bool
    let numberOfTodoItems: Int
    let numberOfCompletedTodoItems: Int
    let selected: Bool
}
