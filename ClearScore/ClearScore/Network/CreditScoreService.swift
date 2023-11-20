//
//  CreditScoreService.swift
//  ClearScore
//
//  Created by Malak Badawy on 14/11/2023.
//

import Foundation

protocol CreditScoreServiceManager {
    func fetchCreditScoreInfo(request: URLRequest) async -> Result<CreditScore, RequestError>
}

class CreditScoreService: CreditScoreServiceManager, APIClient {
    func fetchCreditScoreInfo(request: URLRequest) async -> Result<CreditScore, RequestError> {
        return await execute(request: request, responseModel: CreditScore.self)
    }
}
