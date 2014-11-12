#import "ZLIEnumTest.h"

@implementation ZLIEnumTest

+ (void)runTest {
    [self methodWithEnum:ZLIDefaultEnum1];

    NSLog(@"Custom enum:%ld", ZLICustomEnum2);
}

+ (void)methodWithEnum:(ZLIDefaultEnum)enumParam {
    NSLog(@"Default enum:%ld", enumParam);
}

@end
