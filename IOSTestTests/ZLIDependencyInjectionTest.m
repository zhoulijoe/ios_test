#import <Typhoon/Typhoon.h>
#import "ZLIObjectAssembly.h"
#import "ZLISuperClass.h"
#import "ZLISubbClass.h"
#import <Kiwi/Kiwi.h>

SPEC_BEGIN(DependencyInjection)

describe(@"Using Typhoon", ^{
    TyphoonBlockComponentFactory *factory =
        [[TyphoonBlockComponentFactory alloc] initWithAssemblies:@[
            [ZLIObjectAssembly assembly]
        ]];
    ZLIObjectAssembly *objAssembly = (ZLIObjectAssembly *)factory;

    context(@"Normal object creation", ^{
        it(@"Empty object", ^{
            ZLISubbClass *subbClass = [objAssembly ZLISubbClass];
            [[subbClass should] beNonNil];
        });

        it(@"Initializer injection", ^{
            ZLISuperClass *superClass = [objAssembly ZLISuperClass];
            [[superClass.firstName should] equal:@"Joe"];
            [[superClass.lastName should] equal:@"Black"];
        });

        it(@"Using class method for creation", ^{
            ZLISuperClass *superClass = [objAssembly ZLISuperClassClassMethod];
            superClass.firstName = @"John";
            [[superClass.firstName should] equal:@"John"];
        });

        it(@"Property injection", ^{
            ZLISuperClass *superClass = [objAssembly ZLISuperClassProperty];
            [[superClass.firstName should] equal:@"Jane"];
            [[superClass.spouse.firstName should] equal:@"Joe"];
        });

        it(@"Property injection with primitive type", ^{
            ZLISuperClass *superClass = [objAssembly ZLISuperClassWithAge:@10 happy:@YES];
            [[theValue(superClass.age) should] equal:theValue(10)];
            [[theValue(superClass.happy) should] beYes];
        });

        it(@"Method injection", ^{
            ZLISuperClass *superClass = [objAssembly ZLISuperClassMethod];
            [[superClass.firstName should] equal:@"Jack"];
            [[superClass.lastName should] equal:@"Black"];
        });

        it(@"Pre and post injection hook", ^{
            ZLISuperClass *superClass = [objAssembly ZLISuperClassPrePostHook];
            [[superClass.firstName should] equal:@"Jane"];
            [[superClass.height should] beNonNil];
            [[superClass.stackTrace should] haveCountOf:1];
        });

        it(@"Inject with runtime value", ^{
            ZLISuperClass *superClass = [objAssembly ZLISuperClassWithFirstName:@"Mike" lastName:@"Wang"];
            [[superClass.firstName should] equal:@"Mike"];
            [[superClass.lastName should] equal:@"Wang"];
        });

        it(@"Inject collection", ^{
            ZLISuperClass *superClass = [objAssembly ZLISuperClassWithCollection];
            [[superClass.stackTrace[0] should] beKindOfClass:[ZLISuperClass class]];
            [[superClass.stackTrace[1] should] beKindOfClass:[ZLISubbClass class]];
        });
    });
});

SPEC_END
