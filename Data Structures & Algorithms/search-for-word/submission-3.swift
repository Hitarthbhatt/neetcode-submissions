class Solution {
    var row = 0
    var col = 0
    var visited: [[Bool]] = []
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        row = board.count
        col = board[0].count
        visited = Array(repeating: Array(repeating: false, count: col), count: row)
        let first = word.first!

        for i in 0..<row {
            for j in 0..<col {
                if board[i][j] == first {
                    let isWordExist = isExist(board, i, j, word, "")
                    if isWordExist {
                        return true
                    }
                }
            }
        }
        
        return false
    }
    
    func isExist(_ board: [[Character]], _ i: Int, _ j: Int, _ word: String, _ newWord: String) -> Bool {
        if newWord == word { return true }
        if i < 0 || i >= row || j < 0 || j >= col || newWord.count > word.count { return false }
        if visited[i][j] { return false }
        
        visited[i][j] = true
        // left
        let left = isExist(board, i, j - 1, word, newWord + String(board[i][j]))
        
        // right
        let right = isExist(board, i, j + 1, word, newWord + String(board[i][j]))
        
        // up
        let up = isExist(board, i - 1, j, word, newWord + String(board[i][j]))
        
        // down
        let down = isExist(board, i + 1, j, word, newWord + String(board[i][j]))
        
        visited[i][j] = false
        
        return up || left || right || down
    }
}
