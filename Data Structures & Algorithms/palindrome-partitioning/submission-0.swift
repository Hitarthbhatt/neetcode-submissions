class Solution {
    var result: [[String]] = []
    func partition(_ s: String) -> [[String]] {
        var output: [String] = []
        makePartition(Array(s), 0, &output)
        return result
    }
    
    private func makePartition(_ words: [Character], _ index: Int, _ output: inout [String]) {
        if index >= words.count {
            result.append(output)
            return
        }
        
        for i in index..<words.count {
            if isPalindrome(words, index, i) {
                output.append(String(words[index...i]))
                makePartition(words, i + 1, &output)
                output.removeLast()
            }
        }
    }
    
    func isPalindrome(_ word: [Character], _ i: Int, _ j: Int) -> Bool {
        var i = i, j = j
        
        while i < j {
            if word[i] != word[j] { return false }
            i += 1
            j -= 1
        }
        
        return true
    }
}
