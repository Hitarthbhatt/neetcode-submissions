class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let sNums = nums.sorted()
        var ans: Set<[Int]> = .init()
        
        for index in sNums.indices {
            let target = sNums[index]
            let result = pointerSearch(on: sNums, index: index + 1, target: -target)
            if !result.isEmpty {
                result.forEach { item in
                    ans.insert(item)
                }
            }
        }
        return Array(ans)
    }
    
    private func pointerSearch(on nums: [Int], index: Int, target: Int) -> [[Int]] {
        guard index < nums.count else { return [] }
        var j = index
        var k = nums.count - 1
        var result: [[Int]] = []
        
        while j < k {
            let sum = nums[j] + nums[k]
            if sum == target {
                result.append([-target, nums[j], nums[k]])
                j += 1
                k -= 1
            } else if sum < target {
                j += 1
            } else {
                k -= 1
            }
        }
        
        return result
    }
}