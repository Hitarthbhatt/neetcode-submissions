class Solution {
    func rob(_ nums: [Int]) -> Int {
        let n = nums.count
        var visited: [Int] = Array(repeating: -1, count: n + 1)

        func dfs(_ i: Int) -> Int {
            if i >= n { return 0 }
            if visited[i] != -1 {
                return visited[i]
            }

            let notChoose = dfs(i+1)
            let choose = dfs(i+2) + nums[i]

            visited[i] = max(choose, notChoose)
            return visited[i]
        }

        return dfs(0)
    }
}
