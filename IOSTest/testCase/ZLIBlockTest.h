#import "ZLITest.h"

typedef void (^ZLISimpleBlock)(void);

@interface ZLIBlockTest : NSObject <ZLITest>

+ (void)runTest;

@property (copy) void (^blockProperty)(void);
@property (copy) ZLISimpleBlock simpleBlockProperty;

- (void)dummyInstanceMethod;

@end
