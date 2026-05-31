class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        let nextSmallers = getNextSmallerIdx(heights)
        let prevSmallers = getPrevSmallerIdx(heights)
        
        var maxArea: Int = 0
        
        for i in 0..<heights.count {
            let width = nextSmallers[i] - prevSmallers[i] + 1
            maxArea = max(maxArea, heights[i] * width)
        }
        
        return maxArea
    }
    
    func getNextSmallerIdx(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var result: [Int] = Array(repeating: n, count: n)
        var stack: [Int] = []
        
        for i in stride(from: n-1, through: 0, by: -1) {
            while !stack.isEmpty, nums[stack.last!] >= nums[i] {
                stack.removeLast()
            }
            
            if !stack.isEmpty {
                result[i] = stack.last!
            }
            
            stack.append(i)
        }
        
        for i in stride(from: n-1, through: 0, by: -1) {
            result[i] -= 1
        }
        
        return result
    }
    
    func getPrevSmallerIdx(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var result: [Int] = Array(repeating: -1, count: n)
        var stack: [Int] = []
        
        for i in 0..<n {
            while !stack.isEmpty, nums[stack.last!] >= nums[i] {
                stack.removeLast()
            }
            
            if !stack.isEmpty {
                result[i] = stack.last!
            }
            
            stack.append(i)
        }
        
        for i in 0..<n {
            result[i] += 1
        }
        
        return result
    }
}