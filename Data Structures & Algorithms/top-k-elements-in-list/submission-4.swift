class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var result: [Int] = []
        var map: [Int: Int] = [:]
        
        for num in nums {
            map[num, default: 0] += 1
        }
        
        var bucket: [[Int]] = Array(repeating: [], count: nums.count + 1)
        for (key, value) in map {
            bucket[value].append(key)
        }
        
        for index in stride(from: bucket.count - 1, through: 0, by: -1) {
            if bucket[index].isEmpty { continue }
            if result.count == k { break }
            result.append(contentsOf: bucket[index])
        }
        return result
    }
}