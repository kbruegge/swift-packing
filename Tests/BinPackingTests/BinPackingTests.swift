import XCTest
// In order to get access to our code, without having to make all
// of our types and functions public, we can use the @testable
// keyword to also import all internal symbols from our app target.
@testable import BinPackingLib

class BinPackingTest: XCTestCase {
    func testSums() {
        let packages = [10, 5, 5, 2]
        let bins = firstFit(packages: packages, capacity: 20 )
        print(bins)
        
    }
}
