class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var queue: [Int] = []
        var n = nums.count
        var ans: [Int] = []
        var i = 0
        
        for index in 0..<k {
            let val = nums[index]
            while !queue.isEmpty && (queue.last ?? 0) < val {
                queue.removeLast()
            }
            queue.append(val)
        }
        
        ans.append(queue.first!)
        
        for j in k..<n {
            let val = nums[j]
            while !queue.isEmpty && (queue.last ?? 0) < val {
                queue.removeLast()
            }
            queue.append(val)
            if let first = queue.first, first == nums[i] {
                queue.removeFirst()
            }
            i += 1
            
            ans.append(queue.first!)
        }
        
        return ans
    }
}