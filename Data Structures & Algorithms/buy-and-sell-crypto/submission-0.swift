class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0 }
        var left = 0, right = 1
        var maxP = 0
        
        while right < prices.count {
            if prices[left] < prices[right] {
                maxP = max(maxP, prices[right] - prices[left])
            } else {
                left = right
            }
            
            right += 1
        }
        
        return maxP
    }
}
