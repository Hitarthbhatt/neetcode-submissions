class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        let values = nextGreaterElements(temperatures)
        var result = Array(repeating: 0, count: temperatures.count)
        
        for (i, val) in values.enumerated() {
            guard val != -1 else { continue }
            result[i] = val - i
        }
        
        print(result)
        return result
    }
    
    private func nextGreaterElements(_ nums: [Int]) -> [Int] {
        var result = Array(repeating: -1, count: nums.count)
        var stack: [Int] = []
        
        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            
            while let last = stack.last, nums[last] <= nums[i] {
                stack.removeLast()
            }
            
            if let last = stack.last {
                result[i] = last
            }
            
            stack.append(i)
        }
        
        return result
    }
}