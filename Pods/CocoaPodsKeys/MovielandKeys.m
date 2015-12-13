//
// Generated by CocoaPods-Keys
// on 13/12/2015
// For more information see https://github.com/orta/cocoapods-keys
//

#import <objc/runtime.h>
#import <Foundation/NSDictionary.h>
#import "MovielandKeys.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wincomplete-implementation"

@implementation MovielandKeys

#pragma clang diagnostic pop

+ (BOOL)resolveInstanceMethod:(SEL)name
{
  NSString *key = NSStringFromSelector(name);
  NSString * (*implementation)(MovielandKeys *, SEL) = NULL;

  if ([key isEqualToString:@"theMovieDataBaseApiKey"]) {
    implementation = _podKeys07caf27c62d71f30b09e46b60beef395;
  }

  if (!implementation) {
    return [super resolveInstanceMethod:name];
  }

  return class_addMethod([self class], name, (IMP)implementation, "@@:");
}

static NSString *_podKeys07caf27c62d71f30b09e46b60beef395(MovielandKeys *self, SEL _cmd)
{
  
    
      char cString[33] = { MovielandKeysData[594], MovielandKeysData[731], MovielandKeysData[140], MovielandKeysData[684], MovielandKeysData[614], MovielandKeysData[201], MovielandKeysData[554], MovielandKeysData[247], MovielandKeysData[536], MovielandKeysData[237], MovielandKeysData[320], MovielandKeysData[985], MovielandKeysData[28], MovielandKeysData[94], MovielandKeysData[90], MovielandKeysData[824], MovielandKeysData[576], MovielandKeysData[566], MovielandKeysData[902], MovielandKeysData[374], MovielandKeysData[674], MovielandKeysData[357], MovielandKeysData[7], MovielandKeysData[590], MovielandKeysData[413], MovielandKeysData[838], MovielandKeysData[584], MovielandKeysData[1025], MovielandKeysData[782], MovielandKeysData[935], MovielandKeysData[553], MovielandKeysData[210], '\0' };
    
    return [NSString stringWithCString:cString encoding:NSUTF8StringEncoding];
  
}


static char MovielandKeysData[1026] = "rByArBd1YVz79hsu3rokJ+amsGFN8mmrDcGbB3xwKDnTloyjlEdfnnx8NqrJDZ5gdTCjwp55JfLNYIV6icpyF/bpuz7qUUcY2cjVfTpmQqM1XTNFT+nMxydWMcxbpD3QLfs/GDBsL7XHehg86Dlg21mjQjwfHfsQGV//XmjdOhd2NGPyBIRm6MoKhOkUeF39C8ODSZiFD1CB0KXUnm58XS7KsEohgdCOX3AhL6stBt45v0D9CcCOM0cfEEYp3wND8uLnvLg2Bh5WeC6YQwnVg7ReehZgewZXs1AyCtDbDm3B6x67dOP4pdU0WG0xbWj77xdtZ2u3pkw18gQ6T/lY2bwJ3wyjLi2yzNdiSb8obX0u0EZDPNj5i+d0hWKuDZa/ldETy4/jzcKCa4wlguSCdL1MerGEUbjLISA+ZLV9jxPCAEHcivqoNS/NE1V1iRpYn27oKwT6KGkc4Q9FSkc5C8iPzmJYdwQFUjDfFSPgCoPMMy2clagLz+eM2MGaW2vepigxKLLBDZOfsmq2bnTb4tqI7S8FX6xGefX7gawNlceVdpvCl5Db4S5MG7Z4ur1O3sI5kExr3eXRJ/0eyGbXaDq9XT1cxCOWJ6xR2m2GJ95sUZUuhOM/k/eWY28mxXPPe7gnX9wJMDGC4qx+/1Yx/5Dj/DbXLJgSE99Or8rMl3Hgfhj3tp2KZp0tA8fjZ/A1nLkZyatPL+dajWqLbae+rMR2Lwk09GMXvz4bi4KCnxtyrMdcy9vrl9fy+Usn7NdQ2oZhJCwQobrOa8cwhDm3cTrhkQAhx7+2g9HGcvujGil/NA9GfL5yYu0y6trWw/lcXLDCWc8zbQoZtj40eoMrH+IkycKtUqx1dSTGeKHoHJnJHWJE+pqWt25VHpfsmr+RgMcQp15p5C0y8yz6ryPK+AXNReNxP8kqi1MQAUc8slupSNZITw6mx5oWvKD/tuZ2R3CCgpDo2aNTW9g3T7eTJHBMOdrWXE0cfhoYI5bWvzFL/2rQrAu431OBZBglhCmW\\e";

- (NSString *)description
{
  return [@{
            @"theMovieDataBaseApiKey": self.theMovieDataBaseApiKey,
  } description];
}

- (id)debugQuickLookObject
{
  return [self description];
}

@end