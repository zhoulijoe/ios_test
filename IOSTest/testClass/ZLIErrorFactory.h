#import <Foundation/Foundation.h>

/**
 *
 */
@interface ZLIErrorFactory : NSObject

+ (NSString *)domain;

+ (NSError *)errorWithErrorCode:(NSInteger)errorCode;
+ (NSError *)errorWithErrorCode:(NSInteger)errorCode description:(NSString *)description;
+ (NSError *)errorWithErrorCode:(NSInteger)errorCode userInfo:(NSDictionary *)userInfo;

@end
