//
//  NameAndValueRow.swift
//  ClearScore
//
//  Created by Malak Badawy on 16/11/2023.
//

import SwiftUI

struct NameAndValueRow: View {
    private let nameText: Text
    private let valueText: Text
    
    init(nameText: Text, valueText: Text) {
        self.nameText = nameText
        self.valueText = valueText
    }
    
    var body: some View {
        VStack {
            HStack {
                nameText
                    .padding()
                
                Spacer()
                
                valueText
                    .padding()
            }
            Divider()
        }
    }
}

struct NameAndValueRow_Previews: PreviewProvider {
    static var previews: some View {
        NameAndValueRow(
            nameText: Text("Credit utilization"),
            valueText: Text("44%")
        )
        .previewLayout(.sizeThatFits)
    }
}
