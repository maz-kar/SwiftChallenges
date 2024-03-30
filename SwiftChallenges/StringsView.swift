//
//  StringsView.swift
//  SwiftChallenges
//
//  Created by Maziar Layeghkar on 25.03.24.
//

import SwiftUI

class StringsViewModel: ObservableObject {
    
    func areLettersUniqueWithForLoop(input: String) -> Bool {
        var usedLetters: [Character] = []
        
        for char in input {
            if usedLetters.contains(String(char)) {
                return false
            }
            usedLetters.append(char)
        }
        return true
    }
    
    func areLettersUniqueWithSet(input: String) -> Bool {
        return input.count == Set(input).count
    }
    
    func isStrPalindrome(input: String) -> Bool {
        return String(input.reversed()).lowercased() == input.lowercased()
    }
    
    func strsContainSameChar(strOne: String, strTwo: String) -> Bool {
        return strOne.sorted() == strTwo.sorted()
    }
    
    func countTargetedCharWithForLoop(str: String, targetedLetter: Character) -> Int {
        var result = 0
        
        for char in str {
            if char == targetedLetter {
                result += 1
            }
        }
        return result
    }
    
    func countTargetedCharWithReduce(str: String, targetedLetter: Character) -> Int {
        return str.reduce(0) { count, letter in
            letter == targetedLetter ? count + 1 : count
        }
    }
    
    func countTargetedCharWithReplacingOccurance(str: String, targetedLetter: Character) -> Int {
        let modifiedStr = str.replacingOccurrences(of: String(targetedLetter), with: "")
        return str.count - modifiedStr.count
    }
    
    func countAllLettersInString(str: String) -> [Character: Int] {
        return str.reduce(into: [:]) { count, letter in
            count[letter, default: 0] += 1
        }
    }
    
}

extension String {
    func fuzzyContainsA(str: String) -> Bool {
        return self.uppercased().range(of: str.uppercased()) != nil
    }
    
    func fuzzyContainsB(str: String) -> Bool {
        return (self.range(of: str, options: .caseInsensitive) != nil)
    }
}

struct StringsView: View {
    @StateObject private var vm = StringsViewModel()
    
    var body: some View {
        VStack(spacing: 10) {
            Text("areLettersUniqueWithForLoop: \(vm.areLettersUniqueWithForLoop(input: "AaBbCc"))")
            Text("areLettersUniqueWithSet: \(vm.areLettersUniqueWithSet(input: "Hello World!"))")
            Text("isStrPalindrome: \(vm.isStrPalindrome(input: "Rotator"))")
            Text("strsContainSameChar: \(vm.strsContainSameChar(strOne: "a1 b2", strTwo: "b1 a2"))")
            Text("fuzzyContainsA: \("Hello World".fuzzyContainsA(str: "Hello").description)")
            Text("fuzzyContainsB: \("Hello World".fuzzyContainsB(str: "Goodbye").description)")
            Text("countTargetedCharWithForLoop: \(vm.countTargetedCharWithForLoop(str: "Mississippi", targetedLetter: "p"))")
            Text("countTargetedCharWithReduce: \(vm.countTargetedCharWithReduce(str: "Mississippi", targetedLetter: "s"))")
            Text("countTargetedCharWithReplacingOccurance: \(vm.countTargetedCharWithReplacingOccurance(str: "Mississippi", targetedLetter: "M"))")
            Text("countAllLettersInString: \(vm.countAllLettersInString(str: "Mississippi"))")
        }
    }
}

#Preview {
    StringsView()
}
