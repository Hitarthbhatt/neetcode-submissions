class Solution {
    func rob(_ nums: [Int]) -> Int {
        var slast = 0, last = 0
        for num in nums {
            let temp = max(num + slast, last)
            slast = last
            last = temp
        }

        return last
    }
}
