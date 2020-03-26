//
//  File.swift
//  
//
//  Created by Kai on 26.03.20.
//

import Foundation


public extension Sequence{
    
    func sum<T: AdditiveArithmetic>(with: (Element) -> T) -> T {
        return reduce(T.zero, {a, b in a + with(b)})
    }
}

public extension Sequence where Element: AdditiveArithmetic {
    func sum() -> Element { reduce(Element.zero, +) }
}

public func unpack<T: AdditiveArithmetic>(a: Any, with: (Any) -> T) -> T{
    return with(a)
}
public func randomElements(range: Range<Double>, n: Int) -> [Double]{
    let closedRange = ClosedRange.init(uncheckedBounds: (range.lowerBound, range.upperBound))
    return randomElements(range: closedRange, n: n)
}
public func randomElements(range: ClosedRange<Double>, n: Int) -> [Double]{
    return (1...n).map {_ in Double.random(in: range)}
}

public func randomElements(range: Range<Int>, n: Int) -> [Int]{
    let closed_range = ClosedRange.init(range)
    return randomElements(range: closed_range, n: n)
}
public func randomElements(range: ClosedRange<Int>, n: Int) -> [Int]{
    return (1...n).map {_ in Int.random(in: range)}
}



