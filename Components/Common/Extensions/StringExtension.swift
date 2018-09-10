//
//  StringExtension.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/20/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

extension String {
    // removes links from twitter content, users instead can tap on a cell to open safari and visit link
    func removehttp() -> String {
        var returnString = ""
        var isURL = false
        self.enumerated().forEach { character in
            if character.element == "h" {
                if self.count > character.offset + 3 {
                    if self[character.offset...character.offset + 3] == "http" {
                        isURL = true
                    }
                }
            }
            if !isURL {
                returnString += String(character.element)
            }
            else if character.element == " " {
                isURL = false
            }
        }
        return returnString
    }
}

//string extension from https://stackoverflow.com/questions/24092884/get-nth-character-of-a-string-in-swift-programming-language
extension String {
    subscript(pos: Int) -> String {
        precondition(pos >= 0, "character position can't be negative")
        return self[pos...pos]
    }
    subscript(range: CountableRange<Int>) -> String {
        precondition(range.lowerBound >= 0, "range lowerBound can't be negative")
        let lowerIndex = index(startIndex, offsetBy: range.lowerBound, limitedBy: endIndex) ?? endIndex
        return String(self[lowerIndex..<(index(lowerIndex, offsetBy: range.upperBound - range.lowerBound, limitedBy: endIndex) ?? endIndex)])
    }
    subscript(range: ClosedRange<Int>) -> String {
        precondition(range.lowerBound >= 0, "range lowerBound can't be negative")
        let lowerIndex = index(startIndex, offsetBy: range.lowerBound, limitedBy: endIndex) ?? endIndex
        return String(self[lowerIndex..<(index(lowerIndex, offsetBy: range.upperBound - range.lowerBound + 1, limitedBy: endIndex) ?? endIndex)])
    }
}
