//
//  SearchComponentUseCase.swift
//  GlaEyedrops
//
//  Created by 長田公喜 on 2024/04/12.
//

import Foundation

class SearchComponentUseCase {
    static func getDrugsContainSelectedComponents(components: [EYEDROPS_COMPONENTS]) -> [Int] {
        if components.isEmpty { return [] }
        let csv = getCSV()
        var drugs: [Int] = []
        for drug in csv.enumerated() {
            var flag = true
            for component in components {
                if drug.element[component.rawValue] != "1" {
                    flag = false
                    break
                }
            }
            if flag {
                drugs.append(drug.offset)
            }
        }
        return drugs
    }
    
    static func getDrugName(index: Int) -> String? {
        return (getCSV()[safe: index] ?? []).first
    }
    
    static func getDrugComponents(index: Int) -> [EYEDROPS_COMPONENTS] {
        guard let component = getCSV()[safe: index] else { return [] }
        return component.enumerated().filter{ $0.element == "1" }.map { EYEDROPS_COMPONENTS(rawValue: $0.offset) }.filter{ $0 != nil }.map{ $0! }
    }
}

private extension SearchComponentUseCase {
    static func getCSV() -> [[String]] {
        var csv: [[String]] = []
        guard let path = Bundle.main.path(forResource: "gla_eyedrops", ofType: "csv") else { return [] }
        guard let csvString = try? String(contentsOfFile: path, encoding: String.Encoding.utf8) else { return [] }
        let csvLines = csvString.components(separatedBy: .newlines)
        for i in 1..<csvLines.count{
            let line = csvLines[i].components(separatedBy: ",")
            if line != [""]{
                csv.append(line)
            }
        }
        return csv
    }
}
