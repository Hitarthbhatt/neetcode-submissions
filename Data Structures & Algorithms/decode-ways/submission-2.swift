class Solution {
    func numDecodings(_ s: String) -> Int {
        let nums = Array(s).map { String($0) }.compactMap { Int($0) }
        var visited: [Int] = Array(repeating: -1, count: nums.count + 1)
        
        func dfs(_ nums: [Int], _ index: Int) -> Int {
            if index >= nums.count { return 1 }
            if nums[index] == 0 { return 0 }
            
            if visited[index] != -1 { return visited[index] }
            // exc
            let left = dfs(nums, index + 1)
            
            // inc
            var right = 0
            if index + 1 < nums.count && (nums[index] == 1 || (nums[index] == 2 && nums[index + 1] < 7) ) {
                right = dfs(nums, index + 2)
            }
            
            visited[index] = left + right
            return visited[index]
        }
        
        return dfs(nums, 0)
    }
}