//
//  File.swift
//  
//
//  Created by Kai on 26.03.20.
//

import Foundation


extension Sequence where Element: AdditiveArithmetic {
    func sum() -> Element { reduce(Element.zero, +) }
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

