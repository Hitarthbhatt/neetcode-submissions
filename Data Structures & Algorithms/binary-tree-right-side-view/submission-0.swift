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
    func rightSideView(_ root: TreeNode?) -> [Int] {
        return levelOrder(root)
    }

    func levelOrder(_ root: TreeNode?) -> [Int] {
        if root == nil { return [] }
        var queue: [TreeNode?] = []
        queue.append(root)
        var result: [Int] = []

        while (!queue.isEmpty) {
            let n = queue.count

            for i in 0..<n {
                let node = queue.first
                queue.removeFirst()

                if let left = node!!.left {
                    queue.append(left)
                }

                if let right = node!!.right {
                    queue.append(right)
                }

                if i == n-1 {
                    result.append(node!!.val)
                }
            }
        }

        return result
    }
}
