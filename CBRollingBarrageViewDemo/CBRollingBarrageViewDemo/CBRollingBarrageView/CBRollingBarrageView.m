//
//  CBRollingBarrageView.m
//  CBRollingBarrageViewDemo
//
//  Created by 崔冰 on 2018/6/26.
//  Copyright © 2018年 Ziwutong. All rights reserved.
//

#import "CBRollingBarrageView.h"

//每次滚动距离
static const CGFloat CBAutoScrollTextItemHeight = 62.0;

@interface CBRollingBarrageView ()
@property (nonatomic, strong) NSArray *scrollArray;
@property(nonatomic,strong) NSTimer *timer;
@end

@implementation CBRollingBarrageView

- (instancetype)initWithFrame:(CGRect)frame scrollArray:(NSArray *)scrollArray {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.userInteractionEnabled = NO;
        _scrollArray = scrollArray;
        [self createContentOfScrollView];
    }
    return self;
}

- (void)createContentOfScrollView {
    //创建contentView
    self.contentSize = CGSizeMake(self.bounds.size.width, 310);
    //偏移量初值设为0
    self.contentOffset = CGPointMake(0, 0);
    self.showsHorizontalScrollIndicator = NO;
    
    //创建label
    CGFloat labelY = - (_scrollArray.count * CBAutoScrollTextItemHeight);
    CGFloat labelW = self.contentSize.width;
    CGFloat labelH = CBAutoScrollTextItemHeight;
    
    //添加两次一样的内容，无限循环使用
    for (int j = 0; j < 2; j++ ) {
        for (int i = 0; i < _scrollArray.count; i++) {
            @autoreleasepool {
                //此处可自定义展示视图的样式
                UILabel *lbl = [[UILabel alloc] init];
                lbl.text = _scrollArray[i];
                lbl.frame = CGRectMake(0, labelY, labelW, labelH);
                labelY += CBAutoScrollTextItemHeight;
                self.contentSize = CGSizeMake(self.contentSize.width, self.bounds.size.height + CBAutoScrollTextItemHeight);
                [self addSubview:lbl];
            }
        }
    }
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(autoScroll) userInfo:nil repeats:YES];

}

//自动滚动
- (void)autoScroll {
    //滚动速度
    CGFloat offSet = CBAutoScrollTextItemHeight;
    //若果字幕滚动到第二部分重复的部分则把偏移置0，设为第一部分,实现无限循环
    if (self.contentOffset.y <= - (_scrollArray.count * CBAutoScrollTextItemHeight)) {
        self.contentOffset = CGPointMake(0, 0);
    }
    
    //切割每次动画滚动距离
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.contentOffset = CGPointMake(self.contentOffset.x, self.contentOffset.y - offSet);
    } completion:nil];
}
@end
