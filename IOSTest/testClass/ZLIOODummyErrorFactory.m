#import "ZLIOODummyErrorFactory.h"

NSString * const ZLIOODummyErrorDomain = @"com.locationlabs.ZLIOODummyErrorDomain";

@implementation ZLIOODummyErrorFactory

- (id)init {
    return [super initWithDomain:ZLIOODummyErrorDomain];
}

@end
