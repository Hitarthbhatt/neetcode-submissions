class Solution {
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        var stack: [Double] = []
        var data: [(Int, Int)] = []
        
        for j in 0..<position.count {
            data.append((position[j], speed[j]))
        }
        
        data.sort { $0.0 > $1.0 }
        
        for (p, s) in data {
            let time = Double(target - p) / Double(s)
            
            if stack.isEmpty || stack.last! < time {
                stack.append(time)
            }
        }
        
        return stack.count
    }
}