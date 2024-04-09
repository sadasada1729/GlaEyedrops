//
//  SearchDrugUseCase.swift
//  GlaEyedrops
//
//  Created by 長田公喜 on 2024/04/09.
//

import Foundation

enum EYEDROPS_COMPONENTS: Int {
    case pg = 0
    case beta = 1
    case cai = 2
    case alpha1 = 3
    case alpha2 = 4
    case rho = 5
    case ep2 = 6
}

class SearchDrugUseCase {
    
    static func getPredictedEyeDropsIndex(text: String) -> [Int] {
        var eyeDrops: [Int] = []
        judgeTextEquality(text: text, eyeDrops: &eyeDrops)
        judgeTextEquality(text: kanaChanger(text: text), eyeDrops: &eyeDrops)
        judgeTextEquality(text: kanaChanger2(text: text), eyeDrops: &eyeDrops)
        judgeTextEquality(text: kanaChanger3(text: text), eyeDrops: &eyeDrops)
        judgeTextEquality(text: kanaChanger4(text: text), eyeDrops: &eyeDrops)
        return eyeDrops
    }
    
    static func getEyedropsNameFromIndex(index: Int) -> String? {
        return (getCSV()[safe: index] ?? []).first
    }
    
    static func getEyedropsComponentsFromIndex(index: Int) -> [EYEDROPS_COMPONENTS] {
        guard let component = getCSV()[safe: index] else { return [] }
        return component.enumerated().filter{ $0.element == "1" }.map { EYEDROPS_COMPONENTS(rawValue: $0.offset) }.filter{ $0 != nil }.map{ $0! }
    }
}

private extension SearchDrugUseCase {
    static func judgeTextEquality(text: String, eyeDrops: inout [Int]){
        let csv = getCSV()
        if text.isEmpty { return }
        for i in 0..<csv.count{
            let line = csv[i]
            guard let drug = line.first else{ continue }
            if String(drug.prefix(text.count)) == text{
                if !eyeDrops.contains(i){
                    eyeDrops.append(i)
                }
            }
        }
    }
    
    static func kanaChanger(text: String)->String{
        let dict: Dictionary<String,String> =  ["に": "ニ", "ゆ": "ユ", "を": "ヲ", "ま": "マ", "し": "シ", "み": "ミ", "ふ": "フ", "ぐ": "グ", "ご": "ゴ", "で": "デ", "ぞ": "ゾ", "も": "モ", "ち": "チ", "や": "ヤ", "わ": "ワ", "へ": "ヘ", "ず": "ズ", "け": "ケ", "ぎ": "ギ", "む": "ム", "ざ": "ザ", "ほ": "ホ", "い": "イ", "す": "ス", "が": "ガ", "ぢ": "ヂ", "ば": "バ", "な": "ナ", "づ": "ヅ", "た": "タ", "め": "メ", "う": "ウ", "あ": "ア", "ん": "ン", "れ": "レ", "き": "キ", "ろ": "ロ", "か": "カ", "の": "ノ", "は": "ハ", "せ": "セ", "じ": "ジ", "だ": "ダ", "ぬ": "ヌ", "さ": "サ", "こ": "コ", "く": "ク", "ひ": "ヒ", "び": "ビ", "げ": "ゲ", "ら": "ラ", "べ": "ベ", "ね": "ネ", "て": "テ", "と": "ト", "ど": "ド", "り": "リ", "る": "ル", "お": "オ", "そ": "ソ", "つ": "ツ", "ぜ": "ゼ", "ぼ": "ボ", "え": "エ", "ぶ": "ブ", "よ": "ヨ", "ぱ": "パ", "ぴ": "ピ", "ぷ": "プ", "ぺ": "ペ", "ぽ": "ポ", "っ": "ッ", "ゃ": "ャ", "ゅ": "ュ", "ょ": "ョ"]
        var ans: String = ""
        let arr = Array(text)
        for i in 0..<text.count{
            let s = String(arr[i])
            ans += dict[s] ?? s
        }
        return ans
    }
    
    static func kanaChanger2(text: String)->String{
        if text.isEmpty{ return text }
        let dict: Dictionary<String, String> = ["カ": "ガ", "キ": "ギ", "ク": "グ", "ケ": "ゲ", "コ": "ゴ", "サ": "ザ", "シ": "ジ", "ス": "ズ", "セ": "ゼ", "ソ": "ゾ", "タ": "ダ", "チ": "ヂ", "ツ": "ヅ", "テ": "デ", "ト": "ド", "ハ": "バ", "ヒ": "ビ", "フ": "ブ", "ヘ": "ベ", "ホ": "ボ"]
        var kanaText = kanaChanger(text: text)
        let last = String(kanaText.removeLast())
        return kanaText + (dict[last] ?? last)
    }
    
    static func kanaChanger3(text: String)->String{
        if text.isEmpty{ return text }
        let dict: Dictionary<String, String> = ["ハ": "パ", "ヒ": "ピ", "フ": "プ", "ヘ": "ペ", "ホ": "ポ"]
        var kanaText = kanaChanger(text: text)
        let last = String(kanaText.removeLast())
        return kanaText + (dict[last] ?? last)
    }
    
    
    static func kanaChanger4(text: String)->String{
        if text.isEmpty{ return text }
        let dict: Dictionary<String, String> = ["ツ": "ッ", "ヤ": "ャ", "ユ": "ュ", "ヨ": "ョ"]
        var kanaText = kanaChanger(text: text)
        let last = String(kanaText.removeLast())
        return kanaText + (dict[last] ?? last)
    }
    
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
