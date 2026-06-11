class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        let n = nums.count
        var memo = Array(repeating: Array(repeating: -1, count: n + 1), count: n)

        func dfs(_ i: Int, _ j: Int) -> Int {
            if i == n {
                return 0
            }
            if memo[i][j + 1] != -1 {
                return memo[i][j + 1]
            }

            var LIS = dfs(i + 1, j) // not include

            if j == -1 || nums[j] < nums[i] {
                LIS = max(LIS, 1 + dfs(i + 1, i)) // include
            }

            memo[i][j + 1] = LIS
            return LIS
        }

        return dfs(0, -1)
    }
}