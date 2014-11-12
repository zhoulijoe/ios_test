#import <XCTest/XCTest.h>
#import "ZLIRootViewController.h"

@interface IOSTestTests : XCTestCase

@property ZLIRootViewController *vc;

@end

@implementation IOSTestTests

+ (void)setUp {
    NSLog(@"Test class setup: %@", NSStringFromSelector(_cmd));
}

+ (void)tearDown {
    NSLog(@"Test class tearDown: %@", NSStringFromSelector(_cmd));
}

- (void)setUp {
    NSLog(@"%@ per test setup", NSStringFromSelector(_cmd));
    [super setUp];

    self.vc = [ZLIRootViewController new];
}

- (void)tearDown {
    NSLog(@"%@ per test tearDown", NSStringFromSelector(_cmd));
    [super tearDown];
}

/**
 * Dummy test for method that returns a string
 */
- (void)testDogMyCats {
    NSString *input = @"cats";
    NSString *expectedOutput = @"dogs";
    NSString *output = [self.vc dogMyCats:input];
    XCTAssertEqualObjects(output, expectedOutput, @"ZLIRootViewController dogMyCats with input %@ "
                          @"outputs %@ instead of %@", input, output, expectedOutput);
}

/**
 * Test case have access to the application
 */
- (void)testApplicationAccess {
    UIViewController *vc = (UIViewController *)[[[[UIApplication sharedApplication]
        delegate] window] rootViewController];
    XCTAssertNotNil(vc, @"Application's rootViewController shouldn't be nil");
}

@end
