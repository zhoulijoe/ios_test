#import "ZLISubbClass.h"
#import "ZLISuperClass+ZLISuperClassCategory.h"
#import "Kiwi.h"

SPEC_BEGIN(Inheritance)

describe(@"Inheritance test", ^{
    context(@"inherited method", ^{
        it(@"calling grandparent method", ^{
            ZLISubbClass *subbClass = [ZLISubbClass new];
            [subbClass superMethod];
            [[subbClass.stackTrace should] equal:@[@"-[ZLISuperClass superMethod]",
                                                   @"-[ZLISubbClass superMethod]"]];
        });
    });

    context(@"category", ^{
        it(@"calling category method for grandparent", ^{
            ZLISubbClass *subbClass = [ZLISubbClass new];
            [subbClass superCatMethod];
            [[subbClass.stackTrace should] equal:@[@"-[ZLISuperClass(ZLISuperClassCategory) superCatMethod]"]];
        });
    });
});

SPEC_END
