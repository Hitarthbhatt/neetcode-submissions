
class Solution {
    var rowMap: [Int: [Character]] = [:]
    var colMap: [Int: [Character]] = [:]
    var blockMap: [Int: [Character]] = [:]
    
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        let n = 9
        
        for i in 0..<n {
            for j in 0..<n {
                if board[i][j] != "." && !isValid(char: board[i][j], i: i, j: j) {
                    return false
                }
            }
        }
        return true
    }
    
    func isValid(char: Character, i: Int, j: Int) -> Bool {
        if rowMap[i, default: []].contains(char) || colMap[j, default: []].contains(char) {
            return false
        }
        
        let blockCol: Int = Int(ceil(Double(j+1)/3))
        let blockIndex: Int = Int(floor(Double(i)/3) * 3) + blockCol
        
        if blockMap[blockIndex, default: []].contains(char) == true {
            return false
        }
        
        rowMap[i, default: []].append(char)
        colMap[j, default: []].append(char)
        blockMap[blockIndex, default: []].append(char)
        return true
    }
}