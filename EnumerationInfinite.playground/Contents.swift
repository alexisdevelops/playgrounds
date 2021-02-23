import Foundation

struct FibonacciGenerator {
    var previous = 0
    var current = 1
}

extension FibonacciGenerator: Sequence, IteratorProtocol {
    mutating func next() -> Int? {
        defer {
            let next = previous + current
            previous = current
            current = next
        }
        return current
    }
}

var count = 0
for fib in FibonacciGenerator() {
    print(fib)
    count += 1
    if count == 25 { break }
}

