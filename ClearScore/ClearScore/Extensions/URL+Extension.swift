//
//  URL+Extension.swift
//  ClearScore
//
//  Created by Malak Badawy on 14/11/2023.
//

import Foundation

extension URL {
    init(staticString: StaticString) {
        self.init(string: "\(staticString)")!
    }

    static var creditScore: URL {
        URL(staticString: "https://5lfoiyb0b3.execute-api.us-west-2.amazonaws.com/prod/mockcredit/values")
    }
}
