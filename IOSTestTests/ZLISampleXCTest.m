#import <XCTest/XCTest.h>

@interface ZLISampleXCTest : XCTestCase

@end

@implementation ZLISampleXCTest

/**
 * Test case have access to the application
 */
- (void)testApplicationAccess {
    UIViewController *vc = (UIViewController *)[[[[UIApplication sharedApplication]
        delegate] window] rootViewController];
    XCTAssertNotNil(vc, @"Application's rootViewController shouldn't be nil");
}

@end
