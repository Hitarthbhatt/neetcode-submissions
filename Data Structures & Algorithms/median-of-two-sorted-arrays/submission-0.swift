class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var A = nums1, B = nums2
        if A.count > B.count {
            swap(&A, &B)
        }

        let total = A.count + B.count
        let half = total / 2
        var l = 0
        var r = A.count

        while true {
            let i = (l + r) / 2
            let j = half - i

            let Aleft = i > 0 ? Double(A[i - 1]) : -Double.infinity
            let Aright = i < A.count ? Double(A[i]) : Double.infinity
            let Bleft = j > 0 ? Double(B[j - 1]) : -Double.infinity
            let Bright = j < B.count ? Double(B[j]) : Double.infinity

            if Aleft <= Bright && Bleft <= Aright {
                if total % 2 == 1 {
                    return min(Aright, Bright)
                } else {
                    return (max(Aleft, Bleft) + min(Aright, Bright)) / 2.0
                }
            } else if Aleft > Bright {
                r = i - 1
            } else {
                l = i + 1
            }
        }
    }
}