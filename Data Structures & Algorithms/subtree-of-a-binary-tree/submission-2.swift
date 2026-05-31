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
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        return getNode(root, subRoot)
    }

    func getNode(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        if root == nil { return false }
        var result = false
        if (root?.val ?? Int.min) == (subRoot?.val ?? Int.min) {
            result = isSameTree(root, subRoot)
        }

        if result { return true }

        let left = getNode(root?.left, subRoot)
        let right = getNode(root?.right, subRoot)

        return left || right
    }

    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }
        if p == nil || q == nil { return false }
        guard (p?.val ?? -1) == (q?.val ?? -1) else { return false }

        return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
}
