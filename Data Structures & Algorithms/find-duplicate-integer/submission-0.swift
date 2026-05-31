class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var nums = nums

        for num in nums {
            let idx = abs(num)-1
            if nums[idx] < 0 {
                return abs(num)
            }

            nums[idx] *= -1
        }

        return -1
    }
}
