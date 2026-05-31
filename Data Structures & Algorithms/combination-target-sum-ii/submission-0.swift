class Solution {
    var result: [[Int]] = []
    func combinationSum2(_ nums: [Int], _ target: Int) -> [[Int]] {
        var output: [Int] = []
        getCombination(nums.sorted(), target, 0, 0, &output)
        return result
    }
    
    private func getCombination(_ nums: [Int], _ target: Int, _ index: Int, _ sum: Int, _ output: inout [Int]) {
        if sum == target {
            print(output)
            result.append(output)
            return
        }
        
        for i in index..<nums.count {
            if i > index && nums[i] == nums[i - 1] {
                continue
            }
            if sum > target { break }
            output.append(nums[i])
            getCombination(nums, target, i+1, sum + nums[i], &output)
            output.removeLast()
        }
    }
}
