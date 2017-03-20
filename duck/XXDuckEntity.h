//
//  XXDuckEntity.h
//  duck
//
//  Created by tangyuhua on 2017/3/17.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol XXDuckEntity <NSObject, NSCopying, NSCoding>
@property (nonatomic, copy, readonly) NSString *jsonString;
- (void)foo;
@end

extern id XXDuckEntityCreateWithJSON(NSString *json);


