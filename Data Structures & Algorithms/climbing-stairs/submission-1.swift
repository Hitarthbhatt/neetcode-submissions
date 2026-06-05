class Solution {
    var visited: [Int] = []
    func climbStairs(_ n: Int) -> Int {
        visited = Array(repeating: -1, count: n + 1)
        return dfs(n, &visited)
    }

    func dfs(_ n: Int, _ visited: inout [Int]) -> Int {
        if n < 0 { return 0 }
        if n == 0 { return 1 }
        if visited[n] != -1 { return visited[n] }

        let one = dfs(n-1, &visited)
        let two = dfs(n-2, &visited)

        visited[n] = one + two
        return visited[n]
    }
}
