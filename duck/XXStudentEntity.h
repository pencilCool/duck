//
//  XXStudentEntity.h
//  duck
//
//  Created by tangyuhua on 2017/3/17.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XXUserEntity.h"
@protocol XXStudentEntity <XXUserEntity>
@property (nonatomic, copy) NSString *school;
@property (nonatomic, copy) NSString *teacher;
@end
