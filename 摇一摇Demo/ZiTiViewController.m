//
//  ZiTiViewController.m
//  ShakeDemo
//
//  Created by 张矗 on 14-6-14.
//  Copyright (c) 2014年 张矗. All rights reserved.
//

#import "ZiTiViewController.h"
#import "CustomPopView.h"
@interface ZiTiViewController ()

@end

@implementation ZiTiViewController

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
    _NameArray = [[NSMutableArray alloc] initWithArray:[UIFont familyNames]];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [btn addTarget:self action:@selector(bouncePopView:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = right;
}
- (void)bouncePopView:(id)sender
{
    NSLog(@"hahahahhahah");
    CustomPopView *pView = [[CustomPopView alloc] init];
    if (IsIPhone5) {
        pView.frame = CGRectMake(0, 0, 320, 568);
    }else{
        pView.frame = CGRectMake(0, 0, 320, 480);
    }
    [pView show];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _NameArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndefier = @"CellIndefier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndefier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndefier];
    }
    cell.textLabel.text = [_NameArray objectAtIndex:indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:[_NameArray objectAtIndex:indexPath.row] size:18];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
