class Solution {
    func carFleet(_ target: Int, _ position: [Int], _ speed: [Int]) -> Int {
        var lastTime: Double = -1
        var data: [(Int, Int)] = []
        var count = 0

        for j in 0..<position.count {
            data.append((position[j], speed[j]))
        }
        
        data.sort { $0.0 > $1.0 }
        
        for (p, s) in data {
            let time = Double(target - p) / Double(s)
            
            if lastTime == -1 || lastTime < time {
                lastTime = time
                count += 1        
            }
        }
        
        return count
    }
}