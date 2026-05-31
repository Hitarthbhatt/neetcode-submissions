class Solution {
    var result: [[Int]] = []
    func permute(_ nums: [Int]) -> [[Int]] {
        var nums = nums
        performPermutations(&nums, 0)
        return result
    }
    
    func performPermutations(_ nums: inout [Int], _ index: Int) {
        if index > nums.count { return }
        if index == nums.count {
            result.append(nums)
            return
        }
        
        for i in index..<nums.count {
            nums.swapAt(index, i)
            performPermutations(&nums, index + 1)
            nums.swapAt(index, i)
        }
    }
}