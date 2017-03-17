//
//  XXDuckEntity.m
//  duck
//
//  Created by tangyuhua on 2017/3/17.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "XXDuckEntity.h"
@interface XXDuckEntity ()
@property (nonatomic, strong) NSMutableDictionary *innerDictionary;
@end
@implementation XXDuckEntity


- (instancetype)initWithJSONString:(NSString *)json
{
    NSData *data = [json dataUsingEncoding:NSUTF8StringEncoding];
    id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    if ([jsonObject isKindOfClass:[NSDictionary class]]) {
        self.innerDictionary = [jsonObject mutableCopy];
    }
    return self;
}


- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    SEL changedSelector = aSelector;
    if ([self propertyNameScanFromGetterSelector:aSelector]) {
        changedSelector = @selector(objectForKey:);
    }
    else if ([self propertyNameScanFromSetterSelector:aSelector]) {
        changedSelector = @selector(setObject:forKey:);
    }
    return [[self.innerDictionary class] instanceMethodSignatureForSelector:changedSelector];
}



#pragma mark - Helpers

- (NSString *)propertyNameScanFromGetterSelector:(SEL)selector
{
    NSString *selectorName = NSStringFromSelector(selector);
    NSUInteger parameterCount = [[selectorName componentsSeparatedByString:@":"] count] - 1;
    if (parameterCount == 0) {
        return selectorName;
    }
    return nil;
}

- (NSString *)propertyNameScanFromSetterSelector:(SEL)selector
{
    NSString *selectorName = NSStringFromSelector(selector);
    NSUInteger parameterCount = [[selectorName componentsSeparatedByString:@":"] count] - 1;
    
    if ([selectorName hasPrefix:@"set"] && parameterCount == 1) {
        NSUInteger firstColonLocation = [selectorName rangeOfString:@":"].location;
        return [selectorName substringWithRange:NSMakeRange(3, firstColonLocation - 3)].lowercaseString;
    }
    return nil;
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    NSString *propertyName = nil;
    // Try getter
    propertyName = [self propertyNameScanFromGetterSelector:invocation.selector];
    if (propertyName) {
        invocation.selector = @selector(objectForKey:);
        [invocation setArgument:&propertyName atIndex:2]; // self, _cmd, key
        [invocation invokeWithTarget:self.innerDictionary];
        return;
    }
    // Try setter
    propertyName = [self propertyNameScanFromSetterSelector:invocation.selector];
    if (propertyName) {
        invocation.selector = @selector(setObject:forKey:);
        [invocation setArgument:&propertyName atIndex:3]; // self, _cmd, obj, key
        [invocation invokeWithTarget:self.innerDictionary];
        return;
    }
    [super forwardInvocation:invocation];
}
@end
