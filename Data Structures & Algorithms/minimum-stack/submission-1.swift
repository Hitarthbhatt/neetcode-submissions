import Collections

final class MinStack {
    private var stack: Deque<(val: Int, min: Int)> = []

    init() {}

    func push(_ val: Int) {
        let currentMin = stack.last.map { min($0.min, val) } ?? val
        stack.append((val, currentMin))
    }

    func pop() {
        stack.removeLast()
    }

    func top() -> Int {
        stack.last!.val
    }

    func getMin() -> Int {
        stack.last!.min
    }
}