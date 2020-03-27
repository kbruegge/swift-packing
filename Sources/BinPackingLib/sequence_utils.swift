import Foundation


public extension Sequence{
    func sum<T: AdditiveArithmetic>(with: (Element) -> T) -> T {
        return reduce(T.zero, {a, b in a + with(b)})
    }
}

public extension Sequence where Element: AdditiveArithmetic {
    func sum() -> Element { reduce(Element.zero, +) }
}

//public extension RangeExpression {
//
//}

public extension Range where Bound == Int {
    func randomElements(n: Int) -> [Bound] {
        return (1...n).map {_ in Bound.random(in: self)}
    }
}

public extension ClosedRange where Bound == Int {
    func randomElements(n: Int) -> [Bound] {
        return (1...n).map {_ in Bound.random(in: self)}
    }
}


public extension Range where Bound == Double {
    func randomElements(n: Int) -> [Bound] {
        return (1...n).map {_ in Bound.random(in: self)}
    }
}

public extension ClosedRange where Bound == Double {
    func randomElements(n: Int) -> [Bound] {
        return (1...n).map {_ in Bound.random(in: self)}
    }
}
