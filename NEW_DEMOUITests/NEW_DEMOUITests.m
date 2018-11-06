//
//  NEW_DEMOUITests.m
//  NEW_DEMOUITests
//
//  Created by tom on 2018/9/1.
//  Copyright © 2018年 tom. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NEW_DEMOUITests-Swift.h"

@interface NEW_DEMOUITests : XCTestCase

@end

@implementation NEW_DEMOUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElementQuery *tabBarsQuery = app.tabBars;
    XCUIElement *item1Button = tabBarsQuery.buttons[@"Item 1"];
    [item1Button tap];
    [item1Button tap];
    
    [Snapshot snapshot:@"01LoginScreen" timeWaitingForIdle:10];
    
    XCUIElement *element = [[[[[[app childrenMatchingType:XCUIElementTypeWindow] elementBoundByIndex:0] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element;
    [element tap];
    
    XCUIElement *item2Button = tabBarsQuery.buttons[@"Item 2"];
    [item2Button tap];
    [item1Button tap];
    [item2Button tap];
    [element tap];
    [element tap];
    [element tap];
    [element tap];
                // Use recording to get started writing UI tests.
                // Use XCTAssert and related functions to verify your tests produce the correct results.
}

@end
