#import "ZLISuperClass.h"
#import "ZLISuperClass+ZLISuperClassCategory.h"
#import "ZLISubbClass.h"
#import <Kiwi/Kiwi.h>

SPEC_BEGIN(OCBasic)

describe(@"Objective-C basic language syntax", ^{
    context(@"protocol", ^{
        it(@"class and instance method", ^{
            id<ZLIProtocol> superClass = [ZLISuperClass superClass];
            NSString *result = [ZLISuperClass protocolClassMethod];
            [[result should] equal:@"protocolClassMethod"];

            result = [superClass protocolInstanceMethod];
            [[result should] equal:@"protocolInstanceMethod"];
        });
    });

});

SPEC_END
