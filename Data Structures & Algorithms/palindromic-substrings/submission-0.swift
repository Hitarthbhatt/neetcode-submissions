class Solution {
    var resLen: Int = 0
    var n = 0

    func countSubstrings(_ s: String) -> Int {
        n = s.count
        guard n > 1 else { return 1 }
        let sArr = Array(s)
        
        for i in 0..<n {
            if i+1 < n && sArr[i] == sArr[i+1] {
                checkPalindrome(sArr, i, i+1)
            }
            checkPalindrome(sArr, i, i)
        }
        
        return resLen
    }

    func checkPalindrome(_ sArr: [Character], _ left: Int, _ right: Int) {
        var left = left, right = right
        
        while left >= 0 && right < n {
            if sArr[left] != sArr[right] { return }
            resLen += 1
            left -= 1
            right += 1
        }
    }
}
