#import <XCTest/XCTest.h>
#import "ZLISuperClass.h"

@interface ZLISampleXCTest : XCTestCase

@property ZLISuperClass *sc;

@end

@implementation ZLISampleXCTest

+ (void)setUp {
    NSLog(@"Test class setup: %@", NSStringFromSelector(_cmd));
}

+ (void)tearDown {
    NSLog(@"Test class tearDown: %@", NSStringFromSelector(_cmd));
}

- (void)setUp {
    NSLog(@"%@ per test setup", NSStringFromSelector(_cmd));
    [super setUp];

    self.sc = [ZLISuperClass new];
}

- (void)tearDown {
    NSLog(@"%@ per test tearDown", NSStringFromSelector(_cmd));
    [super tearDown];
}

/**
 * Dummy test for method that returns a string
 */
- (void)testGreeting {
    NSString *input = @"hello";
    NSString *expectedOutput = @"hello";
    NSString *output = [self.sc saySomething:input];
    XCTAssertEqualObjects(output, expectedOutput, @"ZLISuperClass saySomething with input %@ "
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
