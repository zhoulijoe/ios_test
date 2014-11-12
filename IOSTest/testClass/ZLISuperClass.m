#import "ZLISuperClass.h"
#import "ZLIUtil.h"

/**
 * Class extension
 */
@interface ZLISuperClass ()

/** A private class property */
@property NSNumber *height;

@end

@implementation ZLISuperClass

+ (ZLISuperClass *)superClass {
    return [self new];
}

+ (ZLISuperClass *)instanceWithFirstName:(NSString *)aFirstName lastName:(NSString *)aLastName {
    return [[self alloc] initWithFirstName:aFirstName lastName:aLastName];
}

+ (void)superClassMethod {
    superClassMethodCalled = YES;
}

+ (BOOL)isSuperClassMethodCalled {
    return superClassMethodCalled;
}

+ (double)methodWithBlock:(double (^)(double, double))block {
    return block(5, 10);
}

- (id)init {
    return [self initWithFirstName:nil lastName:nil];
}

- (id)initWithFirstName:(NSString *)aFirstName lastName:(NSString *)aLastName {
    self = [super init];
    if(self) {
        _firstName = aFirstName;
        _lastName = aLastName;
        _stackTrace = [NSMutableArray array];
    }
    return self;
}

/**
 * Gets called when object gets deallocated in memory
 */
- (void)dealloc {
    NSLog(@"%@", [NSString stringWithUTF8String:__PRETTY_FUNCTION__]);
}

- (void)measureHight {
    self.height = [NSNumber numberWithInt:[ZLIUtil getRandomIntBetween:60 UpperBound:80]];
}

- (void)superMethod {
    [self.stackTrace addObject:[NSString stringWithUTF8String:__PRETTY_FUNCTION__]];
}

- (NSString *)sayHello {
    NSString *helloStr = [NSString stringWithFormat:@"Hello"];
    return [self saySomething:helloStr];
}

- (NSString *)saySomething:(NSString *)greeting {
    return greeting;
}

- (void)methodWithBlockReferenceSelf {
    ZLISuperClass * __weak weakSelf = self;

    self.simpleBlockProperty = ^{
        [weakSelf isKindOfClass:[ZLISuperClass class]];
    };
}

@end
