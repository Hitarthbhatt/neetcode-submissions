class Solution {
    var stack: [Character] = []
    func isValid(_ s: String) -> Bool {
        for char in s {
            if char == "{" || char == "[" || char == "(" {
                stack.append(char)
            } else if isMatching(char) {
                stack.popLast()
            } else {
                return false
            }
        }
        
        return stack.isEmpty
    }
    
    func isMatching(_ char: Character) -> Bool {
        guard let last = stack.last else { return false }
        return (
            last == "{" && char == "}" ||
            last == "(" && char == ")" ||
            last == "[" && char == "]"
        )
    }
}