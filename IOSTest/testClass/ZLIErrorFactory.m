#import "ZLIErrorFactory.h"

@implementation ZLIErrorFactory

+ (NSString *)domain {
    [self doesNotRecognizeSelector:_cmd];

    return nil;
}

+ (NSError *)errorWithErrorCode:(NSInteger)errorCode {
    return [NSError errorWithDomain:[self domain] code:errorCode userInfo:nil];
}

+ (NSError *)errorWithErrorCode:(NSInteger)errorCode description:(NSString *)description {
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey : description};

    return [NSError errorWithDomain:[self domain] code:errorCode userInfo:userInfo];
}

+ (NSError *)errorWithErrorCode:(NSInteger)errorCode userInfo:(NSDictionary *)userInfo {
    return [NSError errorWithDomain:[self domain] code:errorCode userInfo:userInfo];
}

@end
