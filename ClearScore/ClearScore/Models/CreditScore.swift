//
//  CreditScore.swift
//  ClearScore
//
//  Created by Malak Badawy on 14/11/2023.
//

import Foundation

struct CreditScore: Codable {
    let accountIDVStatus: String
    let creditReportInfo: CreditReportInfo
    let dashboardStatus: String
    let personaType: String
    let coachingSummary: CoachingSummary
    let augmentedCreditScore: Int?
}
