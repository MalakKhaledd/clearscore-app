//
//  ClearScoreTests.swift
//  ClearScoreTests
//
//  Created by Malak Badawy on 14/11/2023.
//

import XCTest
@testable import ClearScore

final class ClearScoreTests: XCTestCase {
    func test_fetch_score_empty() async {
        let data: Data? = nil
        let viewModel = CreditScoreViewModel(service: CreditScoreMockService(data: data))
        await viewModel.fetchCreditScore()
        XCTAssertEqual(viewModel.error, .noResponse)
    }
    
    func test_fetch_score_error_type() async {
        let data: Data = """
        {
            "accountIDVStatus":"PASS",
            "creditReportInfo":
                {
                    "score":"514",
                    "scoreBand":4,
                    "clientRef":"CS-SED-655426-708782",
                    "status":"MATCH",
                    "maxScoreValue":700,
                    "minScoreValue":0,
                    "monthsSinceLastDefaulted":-1,
                    "hasEverDefaulted":false,
                    "monthsSinceLastDelinquent":1,
                    "hasEverBeenDelinquent":true,
                    "percentageCreditUsed":44,
                    "percentageCreditUsedDirectionFlag":1,
                    "changedScore":0,
                    "currentShortTermDebt":13758,
                    "currentShortTermNonPromotionalDebt":13758,
                    "currentShortTermCreditLimit":30600,
                    "currentShortTermCreditUtilisation":44,
                    "changeInShortTermDebt":549,
                    "currentLongTermDebt":24682,
                    "currentLongTermNonPromotionalDebt":24682,
                    "currentLongTermCreditLimit":null,
                    "currentLongTermCreditUtilisation":null,
                    "changeInLongTermDebt":-327,
                    "numPositiveScoreFactors":9,
                    "numNegativeScoreFactors":0,
                    "equifaxScoreBand":4,
                    "equifaxScoreBandDescription":"Excellent",
                    "daysUntilNextReport":9
                },
            "dashboardStatus":"PASS",
            "personaType":"INEXPERIENCED",
            "coachingSummary":{
            "activeTodo":false,
            "activeChat":true,
            "numberOfTodoItems":0,
            "numberOfCompletedTodoItems":0,
            "selected":true
        },
            "augmentedCreditScore":null
        }
        """.data(using: .utf8)!
        let viewModel = CreditScoreViewModel(service: CreditScoreMockService(data: data))
        await viewModel.fetchCreditScore()
        let sut = viewModel.creditScore
        XCTAssertNil(sut)
        XCTAssertEqual(viewModel.error, .decode)
    }
    
    func test_fetch_score() async {
        let data: Data = """
        {
            "accountIDVStatus":"PASS",
            "creditReportInfo":
                {
                    "score":514,
                    "scoreBand":4,
                    "clientRef":"CS-SED-655426-708782",
                    "status":"MATCH",
                    "maxScoreValue":700,
                    "minScoreValue":0,
                    "monthsSinceLastDefaulted":-1,
                    "hasEverDefaulted":false,
                    "monthsSinceLastDelinquent":1,
                    "hasEverBeenDelinquent":true,
                    "percentageCreditUsed":44,
                    "percentageCreditUsedDirectionFlag":1,
                    "changedScore":0,
                    "currentShortTermDebt":13758,
                    "currentShortTermNonPromotionalDebt":13758,
                    "currentShortTermCreditLimit":30600,
                    "currentShortTermCreditUtilisation":44,
                    "changeInShortTermDebt":549,
                    "currentLongTermDebt":24682,
                    "currentLongTermNonPromotionalDebt":24682,
                    "currentLongTermCreditLimit":null,
                    "currentLongTermCreditUtilisation":null,
                    "changeInLongTermDebt":-327,
                    "numPositiveScoreFactors":9,
                    "numNegativeScoreFactors":0,
                    "equifaxScoreBand":4,
                    "equifaxScoreBandDescription":"Excellent",
                    "daysUntilNextReport":9
                },
            "dashboardStatus":"PASS",
            "personaType":"INEXPERIENCED",
            "coachingSummary":{
            "activeTodo":false,
            "activeChat":true,
            "numberOfTodoItems":0,
            "numberOfCompletedTodoItems":0,
            "selected":true
        },
            "augmentedCreditScore":null
        }
        """.data(using: .utf8)!
        let viewModel = CreditScoreViewModel(service: CreditScoreMockService(data: data))
        await viewModel.fetchCreditScore()
        let sut = viewModel.creditScore
        XCTAssertEqual(sut?.accountIDVStatus, "PASS")
        XCTAssertEqual(sut?.creditReportInfo.score, 514)
        XCTAssertEqual(sut?.creditReportInfo.scoreBand, 4)
        XCTAssertEqual(sut?.creditReportInfo.clientRef, "CS-SED-655426-708782")
        XCTAssertEqual(sut?.dashboardStatus, "PASS")
        XCTAssertEqual(sut?.personaType, "INEXPERIENCED")
        XCTAssertNil(sut?.augmentedCreditScore)
    }
}
