#import "Kiwi.h"

SPEC_BEGIN(FoundationClasses)

describe(@"Important foundation classes", ^{
    context(@"struct", ^{
        it(@"NSRange", ^{
            NSRange nsrange = NSMakeRange(0, 2);
            NSUInteger loc = nsrange.location;
            NSUInteger len = nsrange.length;
            [[theValue(loc) should] equal:theValue(0)];
            [[theValue(len) should] equal:theValue(2)];

            NSRange *rangePtr = &nsrange;
            (*rangePtr).location = 1;
            [[theValue(nsrange.location) should] equal:theValue(1)];
        });
    });

    context(@"constant", ^{
        it(@"NSNotFound", ^{
            NSString *str = @"hello world";
            NSRange range = [str rangeOfString:@"not found"];
            [[theValue(range.location) should] equal:theValue(NSNotFound)];

            NSArray *array = @[@1, @2];
            NSUInteger idx = [array indexOfObject:@3];
            [[theValue(idx) should] equal:theValue(NSNotFound)];
        });
    });

    context(@"NSString", ^{
        it(@"unicode based character length", ^{
            NSString *str = @"你好";
            [[theValue([str length]) should] equal:theValue(2)];
        });

        it(@"scan string using NSScanner", ^{
            NSString *str = @"4 by 5";
            NSScanner *scanner = [NSScanner scannerWithString:str];
            int row = 0;
            int col = 0;
            [scanner scanInt:&row];
            [scanner scanUpToCharactersFromSet:[NSCharacterSet decimalDigitCharacterSet] intoString:nil];
            [scanner scanInt:&col];
            [[theValue(row) should] equal:theValue(4)];
            [[theValue(col) should] equal:theValue(5)];
        });

        it(@"parse int using regex", ^{
            NSString *str = @"4 by 5";
            int rowcol[2];
            int *intPtr = rowcol;
            NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\d" options:0 error:nil];

            for(NSTextCheckingResult *match in [regex matchesInString:str options:0 range:NSMakeRange(0, [str length])]) {
                *intPtr = [[str substringWithRange:[match range]] intValue];
                intPtr++;
            }
            [[theValue(rowcol[0]) should] equal:theValue(4)];
            [[theValue(rowcol[1]) should] equal:theValue(5)];
        });
    });

    context(@"NSDate", ^{
        it(@"specify a date", ^{
            // current time
            NSDate *now = [NSDate date];
            NSLog(@"Current time is:%@", [now descriptionWithLocale:[NSLocale currentLocale]]);

            // specific date
            NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
            NSDateComponents *comp = [NSDateComponents new];
            comp.year = 2014;
            comp.month = 6;
            comp.day = 1;
            comp.hour = 19;
            NSDate *aDate = [cal dateFromComponents:comp];
            [[theValue([aDate timeIntervalSinceReferenceDate]) should] equal:theValue(423367200.0)];
        });

        it(@"adding time to a date", ^{
            NSCalendar *cal = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];

            NSDateComponents *comp = [NSDateComponents new];
            comp.year = 2014;
            comp.month = 6;
            comp.day = 1;
            NSDate *aDate = [cal dateFromComponents:comp];

            NSDateComponents *addComp = [NSDateComponents new];
            addComp.day = 1;

            NSDate *oneDayLater = [cal dateByAddingComponents:addComp toDate:aDate options:0];
            NSDateFormatter *df = [NSDateFormatter new];
            NSString* format =
            [NSDateFormatter dateFormatFromTemplate:@"d"
                                            options:0
                                             locale:[NSLocale currentLocale]];
            [df setDateFormat:format];
            NSString *day = [df stringFromDate:oneDayLater];
            [[day should] equal:@"2"];
        });
    });
});

SPEC_END
