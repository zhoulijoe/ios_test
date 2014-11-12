#import "ZLIOOErrorFactory.h"

extern NSString *const ZLIOODummyErrorDomain;

typedef NS_ENUM(NSUInteger, ZLIOODummyErrorCode) {
    ZLIOODummyErrorCode1,
    ZLIOODummyErrorCode2
};

/**
 *
 */
@interface ZLIOODummyErrorFactory : ZLIOOErrorFactory

@end
