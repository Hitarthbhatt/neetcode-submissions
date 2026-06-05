class Solution {
    func rob(_ nums: [Int]) -> Int {
        let n = nums.count
        if n == 1 { return nums[0] }
        var visited: [Int] = Array(repeating: -1, count: n + 1)

        func dfs(_ i: Int, _ size: Int) -> Int {
            if i >= size { return 0 }
            if visited[i] != -1 {
                return visited[i]
            }

            let notChoose = dfs(i+1, size)
            let choose = dfs(i+2, size) + nums[i]

            visited[i] = max(choose, notChoose)
            return visited[i]
        }

        let first = dfs(0, n-1)
        visited = Array(repeating: -1, count: n + 1)
        let second = dfs(1, n) 

        return max(first, second)
    }
}
