class Solution {
    private var visited: [[Bool]] = []
    private var row = 0
    private var col = 0

    func numIslands(_ grid: [[Character]]) -> Int {
        row = grid.count
        col = grid[0].count
        visited = Array(repeating: Array(repeating: false, count: col), count: row)
        var count = 0

        for i in 0..<row {
            for j in 0..<col {
                if !visited[i][j] && grid[i][j] == "1" {
                    traverse(grid, i, j)
                    count += 1
                }
            }
        }

        return count
    }

    private func traverse(_ grid: [[Character]], _ i: Int, _ j: Int) {
        if i < 0 || j < 0 || i >= row || j >= col { return }
        if grid[i][j] == "0" || visited[i][j] { return }

        visited[i][j] = true

        // right
        traverse(grid, i, j+1)
        // down
        traverse(grid, i+1, j)
        // left
        traverse(grid, i, j-1)
        // up
        traverse(grid, i-1, j)
    }
}
