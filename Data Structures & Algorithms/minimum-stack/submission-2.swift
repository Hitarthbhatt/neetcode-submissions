class MinStack {
    private var stack: [Int] = []
    private var minStack: [Int] = []

    init() {}

    func push(_ val: Int) {
        stack.append(val)
        let minVal = min(val, minStack.last ?? val)
        minStack.append(minVal)
    }

    func pop() {
        stack.popLast()
        minStack.popLast()
    }

    func top() -> Int {
        return stack.last!
    }

    func getMin() -> Int {
        return minStack.last!
    }
}