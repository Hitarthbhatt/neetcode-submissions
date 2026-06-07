class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var res = nums[0]
        var curMin = 1, curMax = 1

        for num in nums {
            let tmp = curMax * num
            curMax = max(num * curMax, num * curMin, num)
            curMin = min(tmp, num * curMin, num)
            res = max(res, curMax)
        }
        return res
    }
}