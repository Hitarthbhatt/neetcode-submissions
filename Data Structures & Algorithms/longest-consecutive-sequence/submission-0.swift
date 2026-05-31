class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        var maxLength = 0
        let numSet: Set<Int> = Set(nums)
        
        for num in nums {
            var tempLength = 1
            if (!numSet.contains(num-1)) {
                while(numSet.contains(num + tempLength)) {
                    tempLength += 1
                }
                maxLength = max(maxLength, tempLength)
            }
        }
        
        return maxLength
    }
}

