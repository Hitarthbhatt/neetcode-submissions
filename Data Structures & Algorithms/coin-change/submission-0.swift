class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 { return 0 }
        var dp: [[Int]] = Array(repeating: Array(repeating: Int.max, count: amount + 1), count: coins.count + 1)

        func dfs(_ amount: Int, _ index: Int) -> Int {
            if index >= coins.count || amount < 0 { return Int.max }
            if amount == 0 { return 0 }

            if dp[index][amount] != Int.max {
                return dp[index][amount]
            }
            var val = Int.max
            for i in index..<coins.count {
                let new = dfs(amount - coins[i], i)
                if new != Int.max {
                    val = min(val, new + 1)
                }
            }

            dp[index][amount] = val
            return dp[index][amount]
        }

        let val = dfs(amount, 0)
        return val == Int.max ? -1 : val
    }
}
