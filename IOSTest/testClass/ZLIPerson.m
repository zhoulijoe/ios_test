#import "ZLIPerson.h"
#import "ZLIUtil.h"

@interface ZLIPerson ()

// Height in inch
@property NSNumber *height;

// Weight in pound
@property NSNumber *weight;

@end

@implementation ZLIPerson

+ (ZLIPerson *)person {
    return [self new];
}

+ (ZLIPerson *)personWithFirstName:(NSString *)aFirstName lastName:(NSString *)aLastName birthday:(NSDate *)aBirthday {
    return [[self alloc] initWithFirstName:aFirstName lastName:aLastName birthday:aBirthday];
}

- (id)init {
    return [self initWithFirstName:@"Joe" lastName:@"Black" birthday:nil];
}

- (id)initWithFirstName:(NSString *)aFirstName lastName:(NSString *)aLastName birthday:(NSDate *)aBirthday {
    self = [super init];

    if (self) {
        _firstName = aFirstName;
        _lastName = aLastName;
        _birthday = aBirthday;
    }

    return self;
}

- (void)sayHello {
    NSString *helloStr = [NSString stringWithFormat:@"Hello %@ %@", self.firstName, self.lastName];
    [self saySomething:helloStr];
}

- (NSString *)saySomething:(NSString *)greeting {
    NSLog(@"%@", greeting);

    return greeting;
}

- (void)measureHight {
    self.height = [NSNumber numberWithInt:[ZLIUtil getRandomIntBetween:60 UpperBound:80]];
}

- (void)measureWeight {
    self.weight = [NSNumber numberWithInt:[ZLIUtil getRandomIntBetween:140 UpperBound:200]];
}

- (void)dealloc {
    NSLog(@"ZLIPerson is being deallocated");
}

@end