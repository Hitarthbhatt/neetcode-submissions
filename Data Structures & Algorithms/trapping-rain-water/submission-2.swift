class Solution {
    func trap(_ height: [Int]) -> Int {
        var trappedWater: Int = 0
        let n = height.count
        
        guard n > 2 else { return trappedWater }
        
        var prefixHeight: [Int] = Array(repeating: 0, count: n)
        var suffixHeight: [Int] = Array(repeating: 0, count: n)
        
        prefixHeight[0] = height[0]
        suffixHeight[n-1] = height[n-1]
        
        for i in 1..<n {
            prefixHeight[i] = max(prefixHeight[i-1], height[i])
        }
        
        for i in stride(from: n-2, through: 0, by: -1) {
            suffixHeight[i] = max(suffixHeight[i+1], height[i])
        }
        
        for i in height.indices {
            let currentHeight = height[i]
            trappedWater += min(prefixHeight[i], suffixHeight[i]) - currentHeight
        }
        
        return trappedWater
    }
}