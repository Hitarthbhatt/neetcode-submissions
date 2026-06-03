class Solution {
    let MAX = 2147483647
    var row = 0
    var col = 0
    func islandsAndTreasure(_ grid: inout [[Int]]) {
        row = grid.count
        col = grid[0].count
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: col), count: row)
        var queue: [(Int, Int)] = []
        var dist = 0

        func addRoom(_ i: Int, _ j: Int) {
            if i < 0 || j < 0 || i >= row || j >= col { return }
            if grid[i][j] == -1 || visited[i][j] {return }

            visited[i][j] = true
            queue.append((i,j))
        }

        for i in 0..<row {
            for j in 0..<col {
                if grid[i][j] == 0 {
                    queue.append((i,j))
                    visited[i][j] = true
                }
            }
        }

        while !queue.isEmpty {
            for i in 0..<queue.count {
                let val = queue.removeFirst()
                let i = val.0
                let j = val.1
                grid[i][j] = dist
                addRoom(i,j+1)
                addRoom(i,j-1)
                addRoom(i+1,j)
                addRoom(i-1,j)
            }
            dist += 1
        }
    }

    // Common Solution
    private func bfs(_ grid: inout [[Int]], _ i: Int, _ j: Int, _ visited: inout [[Bool]], _ level: Int) {
        if i < 0 || j < 0 || i >= row || j >= col { return }
        if grid[i][j] == -1 || (grid[i][j] == 0 && level != 0) {return }
        if visited[i][j] { return }

        if level != 0 {
            if grid[i][j] < level {
                return
            } else {
                grid[i][j] = min(level, grid[i][j])
            }
        }
        visited[i][j] = true

        // right
        bfs(&grid, i, j+1, &visited, level + 1)

        // down
        bfs(&grid, i+1, j, &visited, level + 1)

        // up
        bfs(&grid, i-1, j, &visited, level + 1)

        // left
        bfs(&grid, i, j-1, &visited, level + 1)
        
        visited[i][j] = false
    }

}
