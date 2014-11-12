#import "ZLIClassTest.h"
#import "ZLISubbClass.h"
#import "ZLISuperClass+ZLISuperClassCategory.h"

@implementation ZLIClassTest

+ (void)runTest {
    ZLISubbClass *subbClass = [ZLISubbClass new];

    [subbClass testMethod];
    [subbClass superCatMethod];

    Class classVar = [ZLISubbClass class];

    [classVar classMethod];
}

@end
