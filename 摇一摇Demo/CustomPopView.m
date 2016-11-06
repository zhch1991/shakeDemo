//
//  CustomPopView.m
//  ShakeDemo
//
//  Created by 张矗 on 14-6-13.
//  Copyright (c) 2014年 张矗. All rights reserved.
//

#import "CustomPopView.h"

@implementation CustomPopView

- (id)init
{
    self = [super init];
    if (self) {
        [self setSelf];
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setSelf];
    }
    return self;
}
- (void)setSelf
{
//    self.frame = CGRectMake(0, 0, 320, 568);
//    self.backgroundColor = [UIColor clearColor];
    
//    self.frame = [[[[UIApplication sharedApplication] delegate] window] bounds];
//    [[[UIApplication sharedApplication].delegate window] addSubview:self];
    
    if (IsIPhone5) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_black_ip5"]];
    }else{
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_black_ip4"]];
    }
    
    
    _View_BG = [[UIView alloc] init];
    
    if (IsIPhone5) {
        _View_BG.frame = CGRectMake(20, 184, 295, 319);
    }else{
        _View_BG.frame = CGRectMake(20, 134, 295, 319);
    }
//    _View_Pop.center=CGPointMake(self.center.x, self.center.y-40);
//    _View_BG.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"img_hongbao"]];
//    _View_BG.layer.masksToBounds = YES;
//    _View_BG.layer.cornerRadius = 5.0f;
    UIImageView *imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_hongbao"]];
    imageview.frame = CGRectMake(0, 0, 295, 319);
    [_View_BG addSubview:imageview];
    
    [self addSubview:_View_BG];
    
    
    _Label_number = [[UILabel alloc] init];
    _Label_number.frame = CGRectMake(55, 30, 192, 51);
    _Label_number.text = @"1,000,000元";
    _Label_number.numberOfLines = 0;
    _Label_number.minimumFontSize = 8;
    _Label_number.font = [UIFont systemFontOfSize:19];
    _Label_number.textAlignment = NSTextAlignmentCenter;
    _Label_number.textColor = [UIColor yellowColor];
    _Label_number.backgroundColor = [UIColor clearColor];
    _Label_number.layer.masksToBounds = YES;
    _Label_number.layer.cornerRadius = 5.0f;

    [_View_BG addSubview:_Label_number];
    
    
    
    _Btn_Ok = [[UIButton alloc] initWithFrame:CGRectMake(44, 240, 192, 51)];
    [_Btn_Ok addTarget:self action:@selector(OKBtnTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    _Btn_Ok.backgroundColor = [UIColor blackColor];
//    [_Btn_Ok setTitle:@"虚拟本金到手" forState:UIControlStateNormal];
    [_Btn_Ok setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"btn_yellow_text"]]];
    [_Btn_Ok setTintColor:[UIColor yellowColor]];
    [_View_BG addSubview:_Btn_Ok];

}
- (void)show
{
    self.frame = [[[[UIApplication sharedApplication] delegate] window] bounds];
    [[[UIApplication sharedApplication].delegate window] addSubview:self];
    
    self.View_BG.center=CGPointMake(self.center.x, self.center.y-40);

    NSLog(@" show x==== %f,y ==== %f",self.View_Pop.center.x,self.View_Pop.center.y);
    NSLog(@" show2 x==== %f,y ==== %f",self.center.x,self.center.y);

    self.transform = CGAffineTransformMakeScale(0.5, 0.5);
    self.alpha = 0;
    [UIView animateWithDuration:0.35 animations:^{
        self.transform = CGAffineTransformMakeScale(1, 1);
        self.alpha = 1;
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (IBAction)OKBtnTouchUpInside:(id)sender {
    
    self.frame = [[[[UIApplication sharedApplication] delegate] window] bounds];
    [[[UIApplication sharedApplication].delegate window] addSubview:self];
    
    self.View_BG.center=CGPointMake(self.center.x, self.center.y-40);

    NSLog(@"OK1 x==== %f,y ==== %f",self.View_Pop.center.x,self.View_Pop.center.y);
    NSLog(@"OK2 x==== %f,y ==== %f",self.center.x,self.center.y);

    [UIView animateWithDuration:0.3 animations:^{
        self.transform = CGAffineTransformMakeScale(0.5, 0.5);
        self.alpha = 0;
    } completion:^(BOOL finished) {
        if (finished) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"newflag" object:nil];
            [self removeFromSuperview];
        }
    }];
}
@end
