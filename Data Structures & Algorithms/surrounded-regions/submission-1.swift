class Solution {
    func solve(_ board: inout [[Character]]) {
        let row = board.count
        let col = board[0].count
        
        func dfs(_ i: Int, _ j: Int) {
            if i < 0 || j < 0 || i == row || j == col { return }
            if board[i][j] == "X" || board[i][j] == "#" { return }
            
            board[i][j] = "#"
            dfs(i, j+1)
            dfs(i, j-1)
            dfs(i+1, j)
            dfs(i-1, j)
        }
        
        for i in 0..<row {
            dfs(i, 0)
            dfs(i, col-1)
        }
        
        for j in 0..<col {
            dfs(0, j)
            dfs(row - 1, j)
        }
        
        
        for i in 0..<row {
            for j in 0..<col {
                if board[i][j] == "O" {
                    board[i][j] = "X"
                }
                
                if board[i][j] == "#" {
                    board[i][j] = "O"
                }
            }
        }
    }
}
