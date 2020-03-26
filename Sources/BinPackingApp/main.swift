import Commander
import Foundation
import BinPackingLib

// The `in` seperates the arguments from the rest of the closure.
// I guess in some ways this is equivalent to writing a function.
// Maybe I should try that
// Here's another exmple for a closure
// let mappedNumbers = numbers.map({ number in 3 * number })
// works like a lambda. duh! Beware tha the scope is different form a lambda.

let main = command(
    Option("capacity", default: 20),
    Option("num_packages", default: 100)
) { capacity, num_packages in
    binPacking(capacity: capacity, num_packages: num_packages)
}

main.run()
