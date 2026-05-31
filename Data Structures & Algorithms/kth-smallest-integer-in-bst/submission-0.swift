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
    var ans = 0
    var cnt = 0
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        cnt = k
        ans = root?.val ?? 0
        smallest(root)
        return ans
    }

    func smallest(_ root: TreeNode?) {
        if root == nil { return }

        smallest(root?.left)
        if cnt == 0 { return }
        cnt -= 1
        if cnt == 0 {
            ans = root!.val
            return
        }

        smallest(root?.right)
    }
}
