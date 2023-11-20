//
//  CreditScoreView.swift
//  ClearScore
//
//  Created by Malak Badawy on 14/11/2023.
//

import SwiftUI

struct CreditScoreView: View {
    @ObservedObject private var viewModel = CreditScoreViewModel()

    var body: some View {
        NavigationView {
            NavigationLink(destination: CreditReportView(creditReport: viewModel.creditScore?.creditReportInfo), label: {
                ZStack {
                    Circle()
                        .stroke(
                            .black,
                            lineWidth: UIConstants.lineWidth
                        )
                        .padding(UIConstants.padding)
                    
                    VStack {
                        Text("Your credit score is")
                            .font(Font.system(size: Fonts.regular))
                            .foregroundColor(.black)
                        
                        Text("\(viewModel.creditScore?.creditReportInfo.score ?? 0)")
                            .font(Font.system(size: Fonts.large))
                            .foregroundColor(.yellow)
                        
                        Text("out of \(viewModel.creditScore?.creditReportInfo.maxScoreValue ?? 700)")
                            .font(Font.system(size: Fonts.regular))
                            .foregroundColor(.black)
                    }
                }
                .padding()
                .task {
                    await viewModel.fetchCreditScore()
                }
                .navigationTitle(Text("Dashboard"))
                .navigationBarTitleDisplayMode(.inline)
                .toolbarBackground(.visible, for: .navigationBar)
            })
        }
    }
}

struct CreditScoreView_Previews: PreviewProvider {
    static var previews: some View {
        CreditScoreView()
    }
}
