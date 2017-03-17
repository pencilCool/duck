//
//  ViewController.m
//  duck
//
//  Created by tangyuhua on 2017/3/17.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) API  *api;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSString *jsonString = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    XXDuckEntity *duck = [[XXDuckEntity alloc] initWithJSONString:jsonString];
    [self.api requestFinished:duck];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (API *)api {
    if(_api == nil) {
        _api = [API new];
    }
    return _api;
}

@end
