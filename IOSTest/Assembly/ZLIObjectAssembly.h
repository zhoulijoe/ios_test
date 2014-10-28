#import "TyphoonAssembly.h"

@interface ZLIObjectAssembly : TyphoonAssembly

- (id)ZLISubbClass;
- (id)ZLISuperClass;
- (id)ZLISuperClassWithAge:(NSNumber *)age happy:(NSNumber *)happy;
- (id)ZLISuperClassClassMethod;
- (id)ZLISuperClassProperty;
- (id)ZLISuperClassMethod;
- (id)ZLISuperClassPrePostHook;
- (id)ZLISuperClassWithFirstName:(NSString *)firstName lastName:(NSString *)lastName;
- (id)ZLISuperClassWithCollection;

@end
