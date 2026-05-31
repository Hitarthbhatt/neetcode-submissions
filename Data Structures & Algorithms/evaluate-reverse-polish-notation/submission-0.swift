class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack: [Int] = []
        for token in tokens {
            if isOperand(token) && stack.count >= 2 {
                performOperation(&stack, token)
            } else {
                stack.append(Int(token)!)
            }
        }
        return stack.removeLast()
    }
    
    private func isOperand(_ token: String) -> Bool {
        return token == "+" || token == "-" || token == "*" || token == "/"
    }
    
    private func performOperation(_ stack: inout [Int], _ operation: String) {
        var second = stack.removeLast()
        var first = stack.removeLast()
        var result: Int = 0
        switch operation {
        case "+":
            result = first + second
        case "-":
            result = first - second
        case "*":
            result = first * second
        case "/":
            let val = Double(first) / Double(second)
            result = val < 0 ? Int(ceil(val)) : Int(floor(val))
        default:
            break
        }
        
        stack.append(result)
    }
}