class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var left = 0
        var right = nums.count - 1

        while (left < right) {
            let total = nums[left] + nums[right]
            if (total == target) {
                return [left+1, right+1]
            }
            if (total < target) {
                left += 1
            } else {
                right -= 1
            }
        }

        return []
    }
}
