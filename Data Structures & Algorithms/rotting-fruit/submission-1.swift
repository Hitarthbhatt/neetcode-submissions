class Solution {
    var row = 0
    var col = 0
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var grid = grid
        row = grid.count
        col = grid[0].count
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: col), count: row)
        var minutes = 0
        var queue: [(Int, Int)] = []

        func markVisible(_ i: Int, _ j: Int) {
            if i < 0 || i >= row || j < 0 || j >= col { return }
            if grid[i][j] == 0 || visited[i][j] { return }
            visited[i][j] = true
            queue.append((i,j))
        }

        for i in 0..<row {
            for j in 0..<col {
                if grid[i][j] == 2 {
                    queue.append((i,j))
                    visited[i][j] = true
                }

                if grid[i][j] == 0 {
                    visited[i][j] = true
                }
            }
        }

        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let val = queue.removeFirst()
                let i = val.0, j = val.1
                grid[i][j] = Int.max

                markVisible(i, j+1)
                markVisible(i, j-1)
                markVisible(i+1, j)
                markVisible(i-1, j)
            }
            minutes += 1
        }

        for i in 0..<row {
            for j in 0..<col {
                if !visited[i][j] {
                    return -1
                }
            }
        }
        return minutes <= 0 ? 0 : minutes - 1
    }
}
