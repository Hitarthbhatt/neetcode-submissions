class Solution {
    var result = Int.max
    var n = 0
    var visited: [[Int]] = []
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        n = cost.count
        let total = cost.reduce(0, +)
        visited = Array(repeating: Array(repeating: -1, count: total+1), count: n+1)

        let first = dfs(cost, 0, 0)
        let second = dfs(cost, 0, 1)
        return min(first, second)
    }

    func dfs(_ costs: [Int], _ cost: Int, _ i: Int) -> Int {
        if i >= n {
            return cost
        }

        if visited[i][cost] != -1 {
            return visited[i][cost]
        }

        let first = dfs(costs, cost + costs[i], i + 1)
        let second = dfs(costs, cost + costs[i], i + 2)
        
        visited[i][cost] = min(first, second)
        return visited[i][cost]
    }
}
