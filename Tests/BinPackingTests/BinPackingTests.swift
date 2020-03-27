import XCTest
// In order to get access to our code, without having to make all
// of our types and functions public, we can use the @testable
// keyword to also import all internal symbols from our app target.
@testable import BinPackingLib

class BinPackingTest: XCTestCase {
    func testValidPackages() {
        let packages = [10, 5, 5, 2]
        let bins = OneDimensionalPacking.firstFit(packages: packages, capacity: 20 )
        
        assert(bins.sum() == packages.sum())
        assert(bins == [20, 2])
    }
    
    func testEmptyPackages() {
        let packages: [Int] = []
        let bins = OneDimensionalPacking.firstFit(packages: packages, capacity: 20 )
        
        assert(bins == [0])
    }
    
    func testNegativePackages() {
        let packages: [Int] = [10, 5, 5, -1]
        let bins = OneDimensionalPacking.firstFit(packages: packages, capacity: 20 )
        
        assert(bins == [19])
    }
}

class RandomSequenceTest: XCTestCase{
    func testOnlyOnes(){
        let n = 100
        let result = (1..<2).randomElements(n: n)!
        assert(result.sum() == n)
        assert(result.count == n)
    }

    func testRangeBelowZero(){
        let n = 100
        let result = (-2...0).randomElements(n: n)!
        assert(result.sum() < 0)
        assert(result.count == n)
    }
    
    func testRandomCollection(){
        let values = [1.0, 1.0, 1.0]
        let result = values.randomElements(n: 2)!
        assert(result.sum()  == 2.0)
        assert(result.count == 2)
    }
    
    func testRandomStringCollection(){
        let values = ["Otto", "Hans", "Helge", "Herbert"]
        let result = values.randomElements(n: 2)!
        assert(result.count == 2)
    }
    
}


class SumSequenceTest: XCTestCase{
    func testSumPositive(){
        let s = [1, 2, 3, 4, 5]
        assert(s.sum() == 15)
    }

    func testSumNegative(){
        let s = [-1, 2, 3, 4, 5]
        assert(s.sum() == 13)
    }
    
    func testSumClosure(){
        let elements = [(name:"a", value: 1), (name: "b", value: 2)]
        let result = elements.sum(with: {el in el.value})
        assert(result == 3)
    }
    
}
