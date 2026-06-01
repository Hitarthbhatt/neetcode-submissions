class Solution {
    var map: [[String]] = [
        [], [],
        ["a", "b", "c"],
        ["d", "e", "f"],
        ["g", "h", "i"],
        ["j", "k", "l"],
        ["m", "n", "o"],
        ["p", "q", "r", "s"],
        ["t", "u", "v"],
        ["w", "x", "y", "z"]
    ]
    var result: [String] = []
    
    func letterCombinations(_ digits: String) -> [String] {
        guard !digits.isEmpty else { return [] }
        makeCombination(Array(digits), 0, "")
        return result
    }
    
    private func makeCombination(_ digits: [Character], _ index: Int, _ output: String) {
        if index >= digits.count {
            result.append(output)
            return
        }
        
        let idx = Int(String(digits[index])) ?? 0
        let values = map[idx]
        
        for val in values {
            makeCombination(digits, index + 1, output + val)
        }
    }
}
