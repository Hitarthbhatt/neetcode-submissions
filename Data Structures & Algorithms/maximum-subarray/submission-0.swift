class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var maxSum = nums[0]
        var sum = 0

        for num in nums {
            sum = max(num, sum+num)
            maxSum = max(sum, maxSum)
        }

        return maxSum
    }
}
