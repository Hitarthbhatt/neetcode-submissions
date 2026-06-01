class Solution {
    private var cols: Set<Int> = .init()
    private var diag: Set<Int> = .init()
    private var antiDiag: Set<Int> = .init()
    private var result: [[String]] = []

    func solveNQueens(_ n: Int) -> [[String]] {
        var board: [[String]] = Array(repeating: Array(repeating: ".", count: n), count: n)
        dfs(&board, 0, n)

        return result
    }

    func dfs(_ board: inout [[String]], _ row: Int, _ n: Int) {
        if row == n {
            result.append(board.map { $0.joined() })
        }

        for col in 0..<n {
            if cols.contains(col) || diag.contains(row - col) || antiDiag.contains(row + col) {
                continue
            }

            cols.insert(col); diag.insert(row - col); antiDiag.insert(row + col); 
            board[row][col] = "Q"
            dfs(&board, row + 1, n)
            board[row][col] = "."
            cols.remove(col); diag.remove(row - col); antiDiag.remove(row + col); 
        }
    }
}