//
//  ObjCUITests.m
//  ObjCUITests
//
//  Created by Patel, Keval Tulsibhai on 3/3/19.
//  Copyright © 2019 Patel, Keval Tulsibhai. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"
@interface ObjCUITests : XCTestCase
@property ViewController * vc;
@end

@implementation ObjCUITests
- (void)setUp {
   
    self.continueAfterFailure = NO;

    [[[XCUIApplication alloc] init] launch];
 }

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {

    XCUIApplication *app = [[XCUIApplication alloc] init];
    [[[app.tables childrenMatchingType:XCUIElementTypeCell] elementBoundByIndex:5].staticTexts[@"test_gslab"] tap];
    XCTAssertTrue([app.staticTexts[@"test_gslab"] exists]);
    XCTAssertTrue([app.staticTexts[@"123"] exists]);
    XCTAssertTrue([app.staticTexts[@"23"] exists]);
    XCTAssertTrue([app.staticTexts[@"2036"] exists]);
}

@end
