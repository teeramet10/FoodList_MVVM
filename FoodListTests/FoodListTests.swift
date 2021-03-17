//
//  FoodListTests.swift
//  FoodListTests
//
//  Created by Yumi JIn on 16/3/2564 BE.
//

import XCTest
@testable import FoodList

class FoodListTests: XCTestCase {

    
    func testSuccessCase() throws {
        let expectation = XCTestExpectation(description: "Fetch list food")

        let repository = FoodRepository(dataSource: MockFoodDataSource(isSuccess: true))
        let viewModel = FoodListViewModel(repository: repository)
        viewModel.outputs.didUpdateData = {
            XCTAssert(true)
            expectation.fulfill()
        }
        
        viewModel.outputs.didError = { error in
            XCTFail()
            expectation.fulfill()
        }
        
        viewModel.inputs.requestData()
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testFailedCase() throws {
        let expectation = XCTestExpectation(description: "Fetch list food")

        let repository = FoodRepository(dataSource: MockFoodDataSource(isSuccess: false))
        let viewModel = FoodListViewModel(repository: repository)
        viewModel.outputs.didUpdateData = {
            XCTAssert(false)
            expectation.fulfill()
        }
        
        viewModel.outputs.didError = { error in
            XCTAssert(true)
            XCTAssert(error != "")
            expectation.fulfill()
        }
        viewModel.inputs.requestData()
        wait(for: [expectation], timeout: 10.0)
    }
}
