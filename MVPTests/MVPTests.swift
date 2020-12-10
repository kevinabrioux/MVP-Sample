//
//  MVPTests.swift
//  MVPTests
//
//  Created by Kevin ABRIOUX on 27/11/2020.
//

import XCTest
@testable import MVP

class MVPTests: XCTestCase {
    func test() {
        let view = ViewMock()
        let presenter = ViewPresenter(view: view)
        presenter.onTap()
        XCTAssertEqual(view.label, "1")
        presenter.onTap()
        presenter.onTap()
        XCTAssertEqual(view.label, "3")
    }
}

class ViewMock: ViewInterface {
    var label: String = ""
    
    func onLabelChange(value: String) {
        self.label = value
    }
}
