class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        let pivot = findPivotIndex(nums)
        print(pivot)
        if nums[pivot] == target {
            return pivot
        }
        
        let left = findItem(nums, left: 0, right: pivot - 1, target: target)
        let right = findItem(nums, left: pivot, right: nums.count-1, target: target)
        
        return max(left, right)
    }
    
    private func findPivotIndex(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        
        while left < right {
            let mid = left + (right - left)/2
            print("mid - ",  mid)
            if nums[mid] < nums[right] {
                right = mid
            } else {
                left = mid + 1
            }
        }
        
        return right
    }
    
    private func findItem(_ nums: [Int], left: Int, right: Int, target: Int) -> Int {
        var left = left, right = right
        
        while left <= right {
            let mid = left + (right - left)/2
            
            if nums[mid] == target {
                return mid
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return -1
    }
}