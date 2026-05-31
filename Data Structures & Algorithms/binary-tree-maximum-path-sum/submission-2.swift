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
    func maxPathSum(_ root: TreeNode?) -> Int {
        dfs(root)
        return maxd
    }

    func dfs(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }

        let left = dfs(root?.left)
        let right = dfs(root?.right)

        let val = root!.val
        let maxVal = max(left + val, right + val)

        maxd = max(maxd, max(val, maxVal))
        maxd = max(maxd, left + right + val)

        return max(val, maxVal)
    }
}
