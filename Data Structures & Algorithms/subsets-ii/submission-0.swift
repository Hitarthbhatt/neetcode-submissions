class Solution {
    var result: Set<[Int]> = .init()
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        getSubsets(nums.sorted(), [], 0)
        return Array(result)
    }
    
    private func getSubsets(_ nums: [Int], _ output: [Int], _ index: Int) {
        if index >= nums.count {
            result.insert(output)
            return
        }
        
        var newOutput = output
        newOutput.append(nums[index])
        // inc
        getSubsets(nums, newOutput, index + 1)
        
        // exc
        getSubsets(nums, output, index + 1)
    }
}