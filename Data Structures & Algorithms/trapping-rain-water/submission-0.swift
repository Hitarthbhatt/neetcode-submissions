class Solution {
    func trap(_ height: [Int]) -> Int {
        var trappedWater: Int = 0
        var right = 0
        let n = height.count
        
        for i in height.indices {
            let currentHeight = height[i]
            var leftMax = currentHeight
            var rightMax = currentHeight
            var li = i - 1, ri = i + 1
            
            while (li >= 0) {
                leftMax = max(leftMax, height[li])
                li -= 1
            }
            
            while (ri < n) {
                rightMax = max(rightMax, height[ri])
                ri += 1
            }
            
            trappedWater += min(leftMax, rightMax) - currentHeight
        }
        
        return trappedWater
    }
}