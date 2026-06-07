class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var res = nums[0]
        var curMin = 1, curMax = 1

        for num in nums {
            let maxMul = curMax * num
            let minMul = curMin * num
            curMax = max(maxMul, minMul, num)
            curMin = min(maxMul, minMul, num)
            res = max(res, curMax)
        }
        return res
    }
}