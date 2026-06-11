class Solution {
    var dp: [[Int]] = []
    func lengthOfLIS(_ nums: [Int]) -> Int {
        let n = nums.count
        dp = Array(repeating: Array(repeating: -1, count: n+1), count: n+1)
        return dfs(nums, 0, -1)
    }
    
    func dfs(_ nums: [Int], _ index: Int, _ j: Int) -> Int {
        if index >= nums.count { return 0 }
        if dp[index][j+1] != -1 { return dp[index][j+1] }
        // inc
        var inc = 0
        if j == -1 || nums[index] > nums[j] {
            inc = dfs(nums, index + 1, index) + 1
        }
        // exc
        let exc = dfs(nums, index + 1, j)
        
        dp[index][j+1] = max(inc, exc)
        return dp[index][j+1]
    }
}