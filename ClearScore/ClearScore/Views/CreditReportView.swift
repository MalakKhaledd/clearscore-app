//
//  CreditReportView.swift
//  ClearScore
//
//  Created by Malak Badawy on 15/11/2023.
//

import SwiftUI

struct CreditReportView: View {
    let creditReport: CreditReportInfo?
    
    init(creditReport: CreditReportInfo? = nil) {
        self.creditReport = creditReport
    }
    
    var body: some View {
        NavigationView {
            VStack {
                NameAndValueRow(
                    nameText: Text("Credit utilization"),
                    valueText: Text("\(creditReport?.percentageCreditUsed ?? 0)%")
                )

                NameAndValueRow(
                    nameText: Text("Current short term credit limit"),
                    valueText: Text("\(creditReport?.currentShortTermCreditLimit ?? 0)")
                )

                NameAndValueRow(nameText: Text("Days until next report"), valueText: Text("\(creditReport?.daysUntilNextReport ?? 0)"))
                
                
                Spacer()
            }
            .navigationTitle(Text("Credit Report"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

struct CreditReportView_Previews: PreviewProvider {
    static var previews: some View {
        CreditReportView()
    }
}
