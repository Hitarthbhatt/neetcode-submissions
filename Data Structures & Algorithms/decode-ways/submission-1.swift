class Solution {
    private var wordMap: [Character] = [
        .init(" "), .init("A"), .init("B"), .init("C"),
        .init("D"), .init("E"), .init("F"), .init("G"),
        .init("H"), .init("I"), .init("J"), .init("K"),
        .init("L"), .init("M"), .init("N"), .init("O"),
        .init("P"), .init("Q"), .init("R"), .init("S"),
        .init("T"), .init("U"), .init("V"), .init("W"),
        .init("X"), .init("Y"), .init("Z")
    ]
    
    func numDecodings(_ s: String) -> Int {
        var nums = Array(s).map { String($0) }.compactMap { Int($0) }
        var visited: [[Int]] = Array(
            repeating: Array(repeating: -1, count: 27),
            count: nums.count + 1
        )
        
        func dfs(_ nums: [Int], _ num: Int, _ index: Int) -> Int {
            if num > 26 || num == 0 { return 0 }
            if index >= nums.count { return 1 }
            
            if visited[index][num] != -1 { return visited[index][num] }
            // exc
            let left = dfs(nums, nums[index], index + 1)
            
            // inc
            let val = (num * 10) + nums[index]
            let right = dfs(nums, val, index + 1)
            
            visited[index][num] = left + right
            return visited[index][num]
        }
        
        return dfs(nums, nums[0], 1)
    }
}