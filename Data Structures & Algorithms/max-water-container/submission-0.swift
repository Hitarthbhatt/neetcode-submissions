class Solution {
    func maxArea(_ heights: [Int]) -> Int {
        var left = 0
        var right = heights.count - 1
        var maxArea = 0
        
        while left < right {
            let height = min(heights[left], heights[right])
            let width = right - left
            let area = height * width
            
            maxArea = max(maxArea, area)
            
            if heights[left] < heights[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        
        return maxArea
    }
}

