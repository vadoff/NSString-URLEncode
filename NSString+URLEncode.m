#import "NSString+URLEncode.h"

@implementation NSString (URLEncode)

- (NSString *)urlEncodedString {
  NSMutableCharacterSet *characterSet = [[NSMutableCharacterSet alloc] init];

  NSRange numRange = NSMakeRange((NSUInteger)'0', 10);
  NSRange AZRange = NSMakeRange((NSUInteger)'A', 26);
  NSRange azRange = NSMakeRange((NSUInteger)'a', 26);
  
  [characterSet addCharactersInRange:numRange];
  [characterSet addCharactersInRange:AZRange];
  [characterSet addCharactersInRange:azRange];
  [characterSet addCharactersInString:@"~!@$&*()-_=:;',./?"];
  
  return [self stringByAddingPercentEncodingWithAllowedCharacters:characterSet];
}

@end
