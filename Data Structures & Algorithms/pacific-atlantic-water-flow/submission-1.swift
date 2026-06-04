class Solution {
    var result: [[Int]] = []
    var visited: [[Bool]] = []
    var row = 0, col = 0
    var pacificCounts: Set<[Int]> = .init()
    var atlanticCounts: Set<[Int]> = .init()
    
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        row = heights.count
        col = heights[0].count
        visited = Array(repeating: Array(repeating: false, count: col), count: row)
        
        func dfs(_ i: Int, _ j: Int, _ prev: Int, _ counts: inout Set<[Int]>) {
            if i < 0 || i >= row || j < 0 || j >= col { return }
            if visited[i][j] || heights[i][j] < prev { return }
            
            visited[i][j] = true
            counts.insert([i,j])
            
            // left
            dfs(i, j-1, heights[i][j], &counts)
            
            // right
            dfs(i, j+1, heights[i][j], &counts)
            
            // up
            dfs(i-1, j, heights[i][j], &counts)
            
            // down
            dfs(i+1, j, heights[i][j], &counts)

        }
        
        for i in 0..<row {
            dfs(i, 0, 0, &pacificCounts)
        }
        
        for j in 0..<col {
            dfs(0, j, 0, &pacificCounts)
        }

        visited = Array(repeating: Array(repeating: false, count: col), count: row)
        for i in 0..<row {
            dfs(i, col-1, 0, &atlanticCounts)
        }

        for j in 0..<col {
            dfs(row-1, j, 0, &atlanticCounts)
        }
        
        let final = pacificCounts.intersection(atlanticCounts)
        result.append(contentsOf: Array(final))
        return result
    }
    
}