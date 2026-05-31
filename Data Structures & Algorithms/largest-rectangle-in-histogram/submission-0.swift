class Solution {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        let n = heights.count
        var maxArea = 0
        var stack = [Int]()

        for i in 0...n {
            while !stack.isEmpty && (i == n || heights[stack.last!] >= heights[i]) {
                let height = heights[stack.removeLast()]
                let width = stack.isEmpty ? i : i - stack.last! - 1
                maxArea = max(maxArea, height * width)
            }
            stack.append(i)
        }
        return maxArea
    }
}