@protocol ZLIProtocol <NSObject>

+ (NSString *)protocolClassMethod;

- (NSString *)protocolInstanceMethod;

@optional

+ (NSString *)optionalProtocolClassMethod;

- (NSString *)optionalProtocolInstanceMethod;

@end
