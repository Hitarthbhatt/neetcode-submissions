class Solution {
    var res: [Character] = []
    var resLen: Int = 0
    var n = 0
    
    func longestPalindrome(_ s: String) -> String {
        n = s.count
        guard n > 1 else { return s}
        let sArr = Array(s)
        
        for i in 0..<n {
            if i+1 < n && sArr[i] == sArr[i+1] {
                checkPalindrome(sArr, i, i+1)
            }
            checkPalindrome(sArr, i, i)
        }
        
        return res.reduce("") { partialResult, new in
            return partialResult + String(new)
        }
    }
    
    func checkPalindrome(_ sArr: [Character], _ left: Int, _ right: Int) {
        var left = left, right = right
        
        while left >= 0 && right < n {
            if sArr[left] != sArr[right] { return }
            if resLen < (right - left + 1) {
                resLen = right - left + 1
                res = Array(sArr[left..<right+1])
            }
            left -= 1
            right += 1
        }
    }
}