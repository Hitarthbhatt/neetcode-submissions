class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let rowCount = matrix.count

        for i in 0..<rowCount {
            if isTargetExist(matrix[i], target) {
                return true
            }
        }
        
        return false
    }
    
    func isTargetExist(_ row: [Int], _ target: Int) -> Bool {
        var low = 0
        var high = row.count - 1
        
        while low <= high {
            let mid = low + (high - low) / 2
            if row[mid] == target {
                return true
            } else if row[mid] < target {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        
        return false
    }
}