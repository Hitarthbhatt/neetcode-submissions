class Solution {
    private var visited: [[Bool]] = []
    private var row = 0
    private var col = 0

    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        row = grid.count
        col = grid[0].count
        visited = Array(repeating: Array(repeating: false, count: col), count: row)
        var count = 0

        for i in 0..<row {
            for j in 0..<col {
                if !visited[i][j] && grid[i][j] == 1 {
                    let val = traverse(grid, i, j)
                    count = max(count, val)
                }
            }
        }

        return count
    }

     private func traverse(_ grid: [[Int]], _ i: Int, _ j: Int) -> Int {
        if i < 0 || j < 0 || i >= row || j >= col { return 0 }
        if grid[i][j] == 0 || visited[i][j] { return 0 }

        visited[i][j] = true

        // right
        let v1 = traverse(grid, i, j+1)
        // down
        let v2 = traverse(grid, i+1, j)
        // left
        let v3 = traverse(grid, i, j-1)
        // up
        let v4 = traverse(grid, i-1, j)

        return v1 + v2 + v3 + v4 + 1 
    }
}