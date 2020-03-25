import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(bin_packing_swiftTests.allTests),
    ]
}
#endif
