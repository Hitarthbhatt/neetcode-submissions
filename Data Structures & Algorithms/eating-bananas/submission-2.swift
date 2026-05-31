class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var low = 1
        var high = piles.max()!
        
        while low < high {
            let mid = low + (high - low)/2
            
            if isPossible(piles, h, mid) {
                high = mid
            } else {
                low = mid + 1
            }
        }
        
        return high
    }
    
    func isPossible(_ piles: [Int], _ h: Int, _ k: Int) -> Bool {
        if k == 0 { return false }
        var hr = 0.0
        for pile in piles {
            let val = ceil(Double(pile)/Double(k))
            hr += val
        }
        
        return hr <= Double(h)
    }
}