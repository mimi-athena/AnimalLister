//
//  ImaginaryAnimalsListerUITests.swift
//  ImaginaryAnimalsListerUITests
//
//  Created by Madison White on 9/17/15.
//  Copyright © 2015 MathNotRequired. All rights reserved.
//

import XCTest

class ImaginaryAnimalsListerUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()

    }
    
    
    func testCellsExistInTableView(){
        let app = XCUIApplication()
        XCTAssert(app.tables.cells.count > 0)
    }
    
    
    func testBackButtonAppears(){
        
        let app = XCUIApplication()
        app.tables.staticTexts["7. Vegetable Lamb of Tartary"].tap()
        
        
        let back = app.navigationBars["ImaginaryAnimalsLister.DetailView"].childrenMatchingType(.Button).matchingIdentifier("Back").elementBoundByIndex(0)
        XCTAssert(back.exists)
        back.tap()
        XCTAssertFalse(back.exists)
    
    }
    
    func testDetailViewLabelAndImageView(){
        
        let app = XCUIApplication()
        app.tables.staticTexts["1. Mermaid"].tap()
        app.images["DetailImageView"].tap()
        
        
        
        
    }
    
    
}
