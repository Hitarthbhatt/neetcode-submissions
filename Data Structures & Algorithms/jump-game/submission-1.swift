class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var goal = nums.count - 1

        for index in stride(from: nums.count - 2, through: 0, by: -1) {
            let val = nums[index]
            if val + index >= goal {
                goal = index
            }
        }

        return goal == 0
    }
}
