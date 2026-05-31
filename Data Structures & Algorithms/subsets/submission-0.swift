class Solution {
    var result: [[Int]] = []
    func subsets(_ nums: [Int]) -> [[Int]] {
        getSubsets(nums, [], 0)
        return result
    }

    func getSubsets(_ nums: [Int], _ output: [Int], _ index: Int) {
        if index >= nums.count { 
            result.append(output)
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
