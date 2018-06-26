//
//  CBRollingBarrageItemView.m
//  CBRollingBarrageViewDemo
//
//  Created by 崔冰 on 2018/6/26.
//  Copyright © 2018年 Ziwutong. All rights reserved.
//

#import "CBRollingBarrageItemView.h"
#import "Masonry.h"

@implementation CBRollingBarrageItemView

+ (instancetype)configScrollTextItem:(DKReportList *)model {
    CBRollingBarrageItemView *view = [[CBRollingBarrageItemView alloc] init];
    UILabel *lblTitle = ({
        UILabel *lbl =  [[UILabel alloc] init];
        lbl.font = [UIFont systemFontOfSize:14];
        lbl;
    });
    
    UILabel *lblDate = ({
        UILabel *lbl =  [[UILabel alloc] init];
        lbl.font = [UIFont systemFontOfSize:10];
        lbl;
    });
    
    UIView *vLine = ({
        UIView *v = [[UIView alloc] init];
        v.backgroundColor = [UIColor grayColor];
        v;
    });
    
    lblTitle.text = [NSString stringWithFormat:@"今日第%@单！恭喜%@ %@ 签约成功！",model.city_flag,model.district_name,model.dealer_name];
    
    //计算与当前时间的时间差
    lblDate.text = model.sign_date;
    [view addSubview:lblTitle];
    [view addSubview:lblDate];
    [view addSubview:vLine];
    
    [lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_top).offset(15);
        make.left.equalTo(view.mas_left).offset(24);
        make.right.equalTo(view.mas_right).offset(-24);
    }];
    
    [lblDate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lblTitle.mas_bottom).offset(8);
        make.left.equalTo(lblTitle.mas_left);
        make.bottom.equalTo(view.mas_bottom).offset(-15);
    }];
    
    [vLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(view.mas_bottom);
        make.left.right.right.equalTo(lblTitle);
        make.height.mas_equalTo(1);
    }];
    return view;
}
@end
