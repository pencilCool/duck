//
//  XXUserEntity.h
//  duck
//
//  Created by tangyuhua on 2017/3/17.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol XXUserEntity <NSObject>
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *sex;
@property (nonatomic, strong) NSNumber *age;
@end

