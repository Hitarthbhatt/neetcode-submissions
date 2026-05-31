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
    var maxd: Int = Int.min
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        dfs(root)
        return maxd
    }

    func dfs(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }

        let left = dfs(root?.left)
        let right = dfs(root?.right)

        maxd = max(maxd, left + right)

        return max(left, right) + 1
    }
}
