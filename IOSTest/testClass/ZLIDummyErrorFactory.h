#import "ZLIErrorFactory.h"

extern NSString *const ZLIDummyErrorDomain;

typedef NS_ENUM(NSUInteger, ZLIDummyErrorCode) {
    ZLIDummyErrorCode1,
    ZLIDummyErrorCode2
};

/**
 *
 */
@interface ZLIDummyErrorFactory : ZLIErrorFactory

@end
