//
//  XXDuckEntity.h
//  duck
//
//  Created by tangyuhua on 2017/3/17.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XXDuckEntity : NSProxy
- (instancetype)initWithJSONString:(NSString *)json;
@end
