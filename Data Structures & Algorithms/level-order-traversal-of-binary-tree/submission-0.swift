/**
 * Definition for a binary tree node.
 * class TreeNode {
 *     var val: Int
 *     var left: TreeNode?
 *     var right: TreeNode?
 *     init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Solution {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        if root == nil { return [] }
        var queue: [TreeNode?] = []
        queue.append(root)
        var result: [[Int]] = []

        while (!queue.isEmpty) {
            var temp: [Int] = []
            let n = queue.count

            for i in 0..<n {
                let node = queue.first
                queue.removeFirst()
                temp.append(node!!.val)

                if let left = node!!.left {
                    queue.append(left)
                }

                if let right = node!!.right {
                    queue.append(right)
                }
            }

            result.append(temp)
        }

        return result
    }
}
