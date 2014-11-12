#import "ZLISuperClass.h"
#import "ZLISuperClass+ZLISuperClassCategory.h"
#import "ZLISubbClass.h"
#import "Kiwi.h"

// Starts from 0
typedef NS_ENUM(NSInteger, ZLIDefaultEnum) {
    ZLIDefaultEnum1,
    ZLIDefaultEnum2
};

typedef NS_ENUM(NSInteger, ZLICustomEnum) {
    ZLICustomEnum1 = 10,
    ZLICustomEnum2 = 20
};

SPEC_BEGIN(OCBasic)

describe(@"Objective-C basic language syntax", ^{
    context(@"enum", ^{
        it(@"default numbering", ^{
            ZLIDefaultEnum defaultEnum = ZLIDefaultEnum1;
            [[theValue(defaultEnum) should] equal:theValue(0)];
        });

        it(@"custom numbering", ^{
            ZLICustomEnum customEnum = ZLICustomEnum1;
            [[theValue(customEnum) should] equal:theValue(10)];
        });
    });

    context(@"class", ^{
        it(@"instantiate", ^{
            ZLISuperClass *superClass1 = [[ZLISuperClass alloc] init];
            [[superClass1 should] beNonNil];

            ZLISuperClass *superClass2 = [ZLISuperClass new];
            [[superClass2 should] beNonNil];

            ZLISuperClass *superClass3 = [ZLISuperClass superClass];
            [[superClass3 should] beNonNil];
        });

        it(@"set property", ^{
            ZLISuperClass *superClass = [ZLISuperClass superClass];
            superClass.firstName = [NSMutableString stringWithString:@"John"];
            NSMutableString *firstName = (NSMutableString *)superClass.firstName;
            [firstName appendString:@"ny"];
            [[superClass.firstName should] equal:@"Johnny"];
        });

        it(@"simple method call", ^{
            ZLISuperClass *superClass = [ZLISuperClass superClass];
            NSString *helloStr = [superClass sayHello];
            [[helloStr should] equal:@"Hello"];
        });

        it(@"get class and calling class method without casting class variable", ^{
            Class classVar = [ZLISuperClass class];
            [classVar superClassMethod];
            [[theValue([classVar isSuperClassMethodCalled]) should] beYes];
        });

        it(@"readonly property", ^{
            ZLISuperClass *superClass = [ZLISuperClass superClass];
            [[superClass.height should] beNil];
            [superClass measureHight];
            [[superClass.height should] beNonNil];
        });

        it(@"readonly property with custom getter", ^{
            ZLISuperClass *superClass = [ZLISuperClass instanceWithFirstName:@"Joe" lastName:@"Black"];
            [[superClass.imageName should] equal:@"JoeBlack"];
        });

        it(@"private property can still be accessed via key-value coding", ^{
            ZLISuperClass *superClass = [ZLISuperClass superClass];
            NSString *privateValue = [superClass valueForKey:@"privateProp"];
            [[privateValue should] equal:@"Hidden message"];
        });

        it(@"method override", ^{
            ZLISubClass *subClass = [ZLISubbClass new];
            NSString *helloStr = [subClass sayHello];
            [[helloStr should] equal:@"HELLO"];
        });
    });

    context(@"category", ^{
        it(@"added method call", ^{
            ZLISuperClass *superClass = [ZLISuperClass instanceWithFirstName:@"Joe" lastName:@"Black"];
            NSString *str = [superClass lastNameFirstNameString];
            [[str should] equal:@"Black, Joe"];
        });
    });

    context(@"protocol", ^{
        it(@"class and instance method", ^{
            id<ZLIProtocol> superClass = [ZLISuperClass superClass];
            NSString *result = [ZLISuperClass protocolClassMethod];
            [[result should] equal:@"protocolClassMethod"];

            result = [superClass protocolInstanceMethod];
            [[result should] equal:@"protocolInstanceMethod"];
        });
    });

    context(@"weak vs strong", ^{
        it(@"weak reference doesn't retain allocated object", ^{
            ZLISuperClass *superClass = [ZLISuperClass superClass];
            __weak ZLISuperClass *weakReference = superClass;
            [[weakReference should] beNonNil];

            superClass = nil;
            //[[expectFutureValue(weakReference) shouldEventuallyBeforeTimingOutAfter(10.0)] beNil];
        });
    });
});

SPEC_END
