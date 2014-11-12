#import <Foundation/Foundation.h>

/**
 *
 */
@interface ZLIOOErrorFactory : NSObject

@property NSString *domain;

- (id)initWithDomain:(NSString *)domain;

- (NSError *)errorWithErrorCode:(NSInteger)errorCode;

@end
