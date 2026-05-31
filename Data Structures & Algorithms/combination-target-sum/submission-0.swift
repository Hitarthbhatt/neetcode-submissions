class Solution {
    var result: [[Int]] = []
    func combinationSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var output: [Int] = []
        getCombination(nums, target, 0, 0, &output)
        return result
    }
    
    private func getCombination(_ nums: [Int], _ target: Int, _ index: Int, _ sum: Int, _ output: inout [Int]) {
        if index >= nums.count || sum > target { return }
        if sum == target {
            result.append(output)
            return
        }
        
        for i in index..<nums.count {
            output.append(nums[i])
            getCombination(nums, target, i, sum + nums[i], &output)
            output.removeLast()
        }
    }
}
