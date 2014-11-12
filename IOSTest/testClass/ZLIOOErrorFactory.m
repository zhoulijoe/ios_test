#import "ZLIOOErrorFactory.h"

@implementation ZLIOOErrorFactory

- (id)init {
    [self doesNotRecognizeSelector:_cmd];

    return nil;
}

- (id)initWithDomain:(NSString *)domain {
    self = [super init];

    if (self) {
        _domain = domain;
    }

    return self;
}

- (NSError *)errorWithErrorCode:(NSInteger)errorCode {
    return [NSError errorWithDomain:self.domain code:errorCode userInfo:nil];
}

@end
