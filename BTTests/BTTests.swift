//
//  BTTests.swift
//  BTTests
//
//  Created by Mahima Personal on 08/02/24.
//

import XCTest
@testable import BT

final class BTTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testNetworkMangerValidCase() {
        let expectation = self.expectation(description: "testNetworkMangerValidCase")
        NetworkManager().getData(pageNum: 0) { completeData in
            XCTAssert(completeData.total != nil)
            XCTAssert(completeData.perPage != nil)
            XCTAssert(completeData.totalPages != nil)
            XCTAssert((completeData.total ?? 0) == (completeData.perPage ?? 0) * (completeData.totalPages ?? 0))
            XCTAssert(completeData.perPage == completeData.data?.count ?? 0)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3)
        
    }

    func testNetworkManagerInvalidCase() {
        let expectation = self.expectation(description: "testNetworkManagerInvalidCase")
        NetworkManager().getData(pageNum: 20) { completeData in
            XCTAssert(completeData.total != nil)
            XCTAssert(completeData.perPage != nil)
            XCTAssert(completeData.totalPages != nil)
            XCTAssert((completeData.total ?? 0) == (completeData.perPage ?? 0) * (completeData.totalPages ?? 0))
            XCTAssertFalse(completeData.perPage == completeData.data?.count ?? 0)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3)
    }
    
    func testPageManagerInitialCase() {
        let pageManager = PageManager()
        let expectation = self.expectation(description: "testPageManager")
        pageManager.getFirstVc { vc in
            if let vc = vc {
                XCTAssert(vc.index == 0)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3)
    }
    
    func testPageManagerNextPage() {
        let pageManager = PageManager()
        let expectation = self.expectation(description: "testPageManagerNextPage")
        pageManager.getFirstVc { vc in
            let nextPage10 = pageManager.getNextPage(for: 10)
            XCTAssertNil(nextPage10)
            let nextPage0 = pageManager.getNextPage(for: 0)
            XCTAssertNotNil(nextPage0)
            let nextPage1 = pageManager.getNextPage(for: 1)
            XCTAssertNil(nextPage1)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3)
    }
    
    func testPageManagerPreviousPage() {
        let pageManager = PageManager()
        let expectation = self.expectation(description: "testPageManagerPreviousPage")
        pageManager.getFirstVc { vc in
            let prevPage0 = pageManager.getPreviousPage(for: 0)
            XCTAssertNil(prevPage0)
            let prevPage10 = pageManager.getPreviousPage(for: 10)
            XCTAssertNil(prevPage10)
            let prevPage1 = pageManager.getPreviousPage(for: 1)
            XCTAssertNotNil(prevPage1)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 3)
    }
}
