//
//  Utils.swift
//  ClearScore
//
//  Created by Malak Badawy on 16/11/2023.
//

import Foundation

final class Utils {
    static func produceDictionary(firstArray: [String], secondArray: [String]) -> [String: String] {
        return Dictionary(uniqueKeysWithValues: zip(firstArray, secondArray))
    }
}
