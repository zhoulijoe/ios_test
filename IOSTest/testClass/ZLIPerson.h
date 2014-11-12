// Data model representing a person

@interface ZLIPerson : NSObject

@property (copy) NSString *firstName;

@property NSString *lastName;

@property NSDate *birthday;

@property (weak) ZLIPerson *spouse;

@property (readonly) NSNumber *height;

@property (readonly) NSNumber *weight;

+ (ZLIPerson *)person;

+ (ZLIPerson *)personWithFirstName:(NSString *)aFirstName lastName:(NSString *)aLastName birthday:(NSDate *)aBirthday;

- (id)initWithFirstName:(NSString *)aFirstName lastName:(NSString *)aLastName birthday:(NSDate *)aBirthday;

- (void)sayHello;

/**
 * Print out a greeting message
 * longggggggggggggggggggggggggggggggggggggggggggggg commenttttttttttttttttttttttttttttttttttttttttt
 *
 * @param greeting - a string containing the greeting message
 * @return void
 */
- (NSString *)saySomething:(NSString *)greeting;

- (void)measureHight;

- (void)measureWeight;

@end