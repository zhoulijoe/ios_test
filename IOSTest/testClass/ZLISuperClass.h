#import "ZLIProtocol.h"

typedef void (^ZLISimpleBlock)(void);

static BOOL superClassMethodCalled = NO;

@interface ZLISuperClass : NSObject <ZLIProtocol>

@property NSString *firstName;
@property NSString *lastName;
@property (weak) ZLISuperClass *spouse;
@property (readonly) NSNumber *height;
/** Updated to indicate the call stack */
@property NSMutableArray *stackTrace;
/** Block property needs to be copied to maintain original scope */
@property (copy) ZLISimpleBlock simpleBlockProperty;

/**
 * Factory method to get an instance
 *
 * @return a new instance of this class
 */
+ (ZLISuperClass *)superClass;

/**
 * Factory method to get an instance with prepopulated properties
 *
 * @param aFirstName first name string
 * @param aLastName last name string
 *
 * @return a new instance
 */
+ (ZLISuperClass *)instanceWithFirstName:(NSString *)aFirstName lastName:(NSString *)aLastName;

/**
 * A class method in super class
 */
+ (void)superClassMethod;

/**
 * Getter for class variable superClassMethodCalled
 *
 * @return superClassMethodCalled
 */
+ (BOOL)isSuperClassMethodCalled;

/**
 * Excute a block param
 *
 * @param block takes 2 double and return 1
 * @return result of the block
 */
+ (double)methodWithBlock:(double (^)(double, double))block;

- (id)initWithFirstName:(NSString *)aFirstName lastName:(NSString *)aLastName;

- (void)measureHight;

/**
 * An instance method in super class
 */
- (void)superMethod;

- (NSString *)sayHello;

- (NSString *)saySomething:(NSString *)greeting;

/**
 * Use weak self reference inside the block
 */
- (void)methodWithBlockReferenceSelf;

@end
