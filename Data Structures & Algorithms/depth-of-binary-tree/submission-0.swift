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
    func maxDepth(_ root: TreeNode?) -> Int {
        return findDepth(root, 0)
    }

    func findDepth(_ root: TreeNode?, _ count: Int) -> Int {
        if root == nil { return count }

        let left = findDepth(root?.left, count + 1)
        let right = findDepth(root?.right, count + 1)

        return max(left, right)
    }
}
