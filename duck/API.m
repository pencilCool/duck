//
//  API.m
//  duck
//
//  Created by tangyuhua on 2017/3/17.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "API.h"

@implementation API
- (void)requestFinished:(XXDuckEntity<XXStudentEntity> *)student {
    NSLog(@"name: %@, school:%@", student.name, student.school);
}
@end
