import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(shameMe_appTests.allTests),
    ]
}
#endif
