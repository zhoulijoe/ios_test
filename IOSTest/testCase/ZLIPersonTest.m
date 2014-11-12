#import "ZLIPersonTest.h"
#import "ZLIPerson.h"
#import "ZLIShoutingPerson.h"
#import "ZLIPerson+ZLIPersonNameDisplayAdditions.h"

@implementation ZLIPersonTest

+ (void)runTest {
    ZLIPerson *newPerson = [ZLIPerson person];
    ZLIPerson * __weak weakPerson = newPerson;
    NSMutableString *mutableFirstName = [NSMutableString stringWithString:@"John"];
    
    newPerson.firstName = mutableFirstName;
    [mutableFirstName appendString:@"ny"];
    
    [newPerson sayHello];
    NSLog(@"Formal name is %@", [newPerson lastNameFirstNameString]);
    NSLog(@"My height is %d", newPerson.height.intValue);
    [newPerson measureHight];
    NSLog(@"My height is %d", newPerson.height.intValue);
    [newPerson measureWeight];
    NSLog(@"My weight is %d", newPerson.weight.intValue);
    
    newPerson = nil;
    
    ZLIPerson *newShoutingPerson = [ZLIShoutingPerson person];
    [newShoutingPerson sayHello];
    
    ZLIPerson *nilPerson;
    if (!nilPerson) {
        NSLog(@"It's nil!");
    }

    NSLog(@"weakperson=%@", weakPerson);
}

@end
