//
//  CreditScoreMockService.swift
//  ClearScore
//
//  Created by Malak Badawy on 20/11/2023.
//

import Foundation

class CreditScoreMockService: CreditScoreServiceManager {
    private var data: Data?
    
    init(data: Data?) {
        self.data = data
    }

    func fetchCreditScoreInfo(request: URLRequest) async -> Result<CreditScore, RequestError> {
        if let data = data {
            do {
                let response = try JSONDecoder().decode(CreditScore.self, from: data)
                return .success(response)
            } catch {
                return .failure(.decode)
            }
        } else {
            return .failure(.noResponse)
        }
    }
}
