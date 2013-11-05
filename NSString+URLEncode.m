#import "NSString+URLEncode.h"

@implementation NSString (URLEncode)

- (NSString *)urlEncodedString {
  NSRange numRange = NSMakeRange((NSUInteger)'0', 10);
  NSRange AZRange = NSMakeRange((NSUInteger)'A', 26);
  NSRange azRange = NSMakeRange((NSUInteger)'a', 26);
  
  NSMutableCharacterSet *characterSet = [[NSMutableCharacterSet alloc] init];
  [characterSet addCharactersInRange:numRange];
  [characterSet addCharactersInRange:AZRange];
  [characterSet addCharactersInRange:azRange];
  [characterSet addCharactersInString:@"~!@$&*()-_=:;',./?"];
  
  NSMutableString *output = [NSMutableString string];
  const unsigned char *source = (const unsigned char *)self.UTF8String;
  
  NSUInteger sourceLen = strlen((const char *)source);
  for (NSUInteger i = 0; i < sourceLen; i++) {
    const unsigned char thisChar = source[i];

    if ([characterSet characterIsMember:thisChar]) {
      [output appendFormat:@"%c", thisChar];
    } else {
      [output appendFormat:@"%%%02X", thisChar];
    }
  }

  return output;
}

@end
