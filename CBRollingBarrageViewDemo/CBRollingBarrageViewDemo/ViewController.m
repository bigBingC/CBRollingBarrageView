//
//  ViewController.m
//  CBRollingBarrageViewDemo
//
//  Created by 崔冰 on 2018/6/26.
//  Copyright © 2018年 Ziwutong. All rights reserved.
//

#import "ViewController.h"
#import "CBRollingBarrageView.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *rollingArray = @[@"第一",@"第二",@"第三",@"第四",@"第五",@"第六",@"第七",@"第八"];
    CBRollingBarrageView *view = [[CBRollingBarrageView alloc] initWithFrame:CGRectMake(0, 80, self.view.bounds.size.width, 310) scrollArray:rollingArray];
    [self.view addSubview:view];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
