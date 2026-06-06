class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 { return 0 }
        var dp: [Int] = Array(repeating: -2, count: amount + 1)

        func dfs(_ amount: Int) -> Int {
            if amount < 0 { return -1 }
            if dp[amount] != -2 { return dp[amount] }
            if amount == 0 { return 0 }

            var val = Int.max
            for coin in coins {
                let new = dfs(amount - coin)
                if new >= 0 {
                    val = min(val, new + 1)
                }
            }

            dp[amount] = val == Int.max ? -1 : val
            return dp[amount]
        }

        let val = dfs(amount)
        return val == Int.max ? -1 : val
    }
}
