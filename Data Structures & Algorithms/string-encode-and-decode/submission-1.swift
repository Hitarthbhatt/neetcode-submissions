class Solution {
    
    func encode(_ strs: [String]) -> String {
        var result = ""
        for str in strs {
            result += "\(str.count)#\(str)"
        }
        
        return result
    }
    
    func decode(_ str: String) -> [String] {
        var index = 0
        
        let strArr = Array(str)
        var result: [String] = []
        while (index < str.count) {
            var start = index
            while (start < str.count && strArr[start] != "#") {
                start += 1
            }
            
            var length = Int(String(strArr[index..<start]))!
            index = start + 1
            var temp = String(strArr[index..<index+length])
            
            result.append(temp)
            index += length
        }
        
        return result
    }
}