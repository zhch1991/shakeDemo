//
//  ImageViewController.m
//  ShakeDemo
//
//  Created by 张矗 on 14-6-14.
//  Copyright (c) 2014年 张矗. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation ImageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_black_ip5"]];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTapped:)];
    [self.imgView addGestureRecognizer:tap];
    self.imgView.userInteractionEnabled = YES;
}

- (void) imageTapped:(UITapGestureRecognizer *)tap
{
    [self dismissModalViewControllerAnimated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
