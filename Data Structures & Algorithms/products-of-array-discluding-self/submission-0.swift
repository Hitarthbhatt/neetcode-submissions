class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else { return nums }
        let n = nums.count
        var prefix: [Int] = Array(repeating: 1, count: n)
        var suffix: [Int] = Array(repeating: 1, count: n)
        var result: [Int] = Array(repeating: 1, count: n)
        for i in 1..<n {
            prefix[i] = prefix[i-1] * nums[i-1]
        }

        for i in stride(from: n-2, through: 0, by: -1) {
            suffix[i] = suffix[i+1] * nums[i+1]
        }

        for i in 0..<n {
            result[i] = prefix[i] * suffix[i]
        }

        return result
    }
}
/*
[1, 2, 4, 6]
[1, 1, 2, 8]
[48, 24, 6, 1]
*/