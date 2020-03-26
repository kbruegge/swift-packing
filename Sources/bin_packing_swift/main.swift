import Commander


// The `in` seperates the arguments from the rest of the closure.
// I guess in some ways this is equivalent to writing a function.
// Maybe I should try that
// Here's another exmple for a closure
// let mappedNumbers = numbers.map({ number in 3 * number })
// works like a lambda. duh! Beware tha the scope is different form a lambda.
let main = command(
    Option("capacity", default: 10),
    Option("num_packages", default: 100)
) { capacity, num_packages in
    binPacking(capacity: capacity, num_packages: num_packages)
}


func binPacking(capacity: Int, num_packages: Int){
    print("Capacity \(capacity), \(num_packages)")
    print(randomElement(range: 1..<capacity, n: num_packages))
    print(randomElement(range: 1..<capacity, n: num_packages))
    
    print(randomElements(range: 1..<capacity, n: num_packages))
    print(randomElements(range: 1...capacity, n: num_packages))
}



func randomElements(range: Range<Int>, n: Int) -> [Int]{
    let closed_range = ClosedRange.init(range)
    return randomElements(range: closed_range, n: n)
}
func randomElements(range: ClosedRange<Int>, n: Int) -> [Int]{
    return (1...n).map {_ in Int.random(in: range)}
}


func randomElement(range: ClosedRange<Int>, n: Int) -> Int{
    return Int.random(in: range)
}

func randomElement(range: Range<Int>, n: Int) -> Int {
    let closed_range = ClosedRange.init(range)
    return randomElement(range: closed_range, n: n)
}



main.run()
