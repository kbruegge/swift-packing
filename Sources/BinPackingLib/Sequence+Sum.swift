import Foundation


public extension Sequence{
    /// Returns sum of values in the collection as unpacked by supplied closure.
    ///
    /// This example sums up all values named `value`in an array of named tuples:
    ///
    ///     let elements = [(name:"a", value: 1), (name: "b", value: 2)]
    ///     let result = elements.sum(with: {element in element.value})
    ///     // result == 3
    ///
    /// Any type of element can be put into the collection as long as a value can be
    /// unpacked which conforms to the AdditiveArithmetic protocol.
    ///
    /// - Returns: Sum of values in the collection as returned by the closure
    ///
    func sum<T: AdditiveArithmetic>(with: (Element) -> T) -> T {
        return reduce(T.zero, {a, b in a + with(b)})
    }
}

public extension Sequence where Element: AdditiveArithmetic {
    /// Returns sum of elements in the collection.
    ///
    /// Call `(1..10).sum()` to sum all numbers from 1 to 10.
    ///
    /// This example sums up all elements in an array:
    ///
    ///     let values = [2.0, 2.5, 0.5]
    ///     let result = names.sum()
    ///     // result == 5
    ///
    /// - Returns: Sum of values in the collection
    ///
    func sum() -> Element { reduce(Element.zero, +) }
}


