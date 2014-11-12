#import "ZLISuperClass.h"

/**
 * In order to define protocol and delegating class that uses it in the same header, a forward declaration
 * of the protocol must be descared.
 */
@protocol ZLISameHeaderProtocol;

@interface ZLISubClass : ZLISuperClass

@property (nonatomic, weak) id<ZLISameHeaderProtocol> delegate;

@end

@protocol ZLISameHeaderProtocol <NSObject>

- (void)delegateMethod:(ZLISubClass *)delegatingObj;

@end