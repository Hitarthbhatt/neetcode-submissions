class Solution {
    var result = Int.max
    var n = 0
    var visited: [Int] = []
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        n = cost.count
        let total = cost.reduce(0, +)
        visited = Array(repeating: -1, count: n+1)

        let first = dfs(cost, 0)
        let second = dfs(cost, 1)
        return min(first, second)
    }

    func dfs(_ cost: [Int], _ i: Int) -> Int {
        if i >= n {
            return 0
        }

        if visited[i] != -1 {
            return visited[i]
        }

        let first = dfs(cost, i + 1)
        let second = dfs(cost, i + 2)
        
        visited[i] = min(first, second) + cost[i]
        return visited[i]
    }
}
