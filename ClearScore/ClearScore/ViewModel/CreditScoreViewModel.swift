//
//  CreditScoreViewModel.swift
//  ClearScore
//
//  Created by Malak Badawy on 14/11/2023.
//

import Foundation

class CreditScoreViewModel: ObservableObject {
    @Published var creditScore: CreditScore?
    @Published var error: RequestError?
    @Published var isLoading: Bool = true
    
    private let service: CreditScoreServiceManager
    
    init(service: CreditScoreServiceManager = CreditScoreService()) {
        self.service = service
    }
    
    @MainActor
    func fetchCreditScore() async {
        let urlRequest = URLRequest(url: .creditScore)
        let result = await service.fetchCreditScoreInfo(request: urlRequest)
        switch result {
        case .success(let response):
            self.creditScore = response
            self.isLoading = false
        case .failure(let error):
            self.error = error
            self.isLoading = false
        }
    }
}
