//
//  CustomPopView.h
//  ShakeDemo
//
//  Created by 张矗 on 14-6-13.
//  Copyright (c) 2014年 张矗. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomPopView : UIView

@property (strong, nonatomic) UIView *View_BG;
@property (strong, nonatomic) UIView *View_Pop;
@property (strong, nonatomic) UILabel *Label_number;
@property (strong, nonatomic) UILabel *Label_Msg;

@property (strong, nonatomic) UIButton *Btn_Ok;

- (void)show;
@end
