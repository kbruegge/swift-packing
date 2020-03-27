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
        let result = (1..<2).randomElements(n: n)
        assert(result.sum() == n)
    }

    func testRangeBelowZero(){
        let n = 100
        let result = (-2...0).randomElements(n: n)
        assert(result.sum() < 0)
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
}
