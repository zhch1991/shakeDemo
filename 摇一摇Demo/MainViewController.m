//
//  MainViewController.m
//  摇一摇Demo
//
//  Created by 张矗 on 14-6-14.
//  Copyright (c) 2014年 张矗. All rights reserved.
//

#import "MainViewController.h"
#import "ImageViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface MainViewController()<AVAudioPlayerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *iphone;
@property (nonatomic, strong) AVAudioPlayer *Player1;
@property (nonatomic, strong) AVAudioPlayer *Player2;

@property (nonatomic, strong) NSTimer *IntervalTimer;
@property (nonatomic, strong) NSTimer *ShakeTimer;
@property (nonatomic, assign) NSInteger count;
@end

@implementation MainViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_black_ip5"]];
    
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"glass.wav" ofType:nil];
    self.Player1 = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path1] error:nil];
    //    self.Player1.numberOfLoops = 1;
    self.Player1.volume = 0.6;
    self.Player1.delegate = self;
    
    
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"star.wav" ofType:nil];
    self.Player2 = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path2] error:nil];
    //    self.Player2.numberOfLoops = 1;
    self.Player2.volume = 0.6;
    self.Player2.delegate = self;
    
    self.IntervalTimer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(shakeAnimation) userInfo:nil repeats:YES];
    
    
}


- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    if([player isEqual:self.Player1])
    {
        NSLog(@"player1 over");
        [self.Player2 play];
    }
    else if ([player isEqual:self.Player2])
    {
        NSLog(@"player2 over");
        ImageViewController *ivc = [[ImageViewController alloc] init];
        [self presentViewController:ivc animated:NO completion:nil];
    }
}


-(void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake) {
        NSLog(@"摇摇摇");
        [self.Player1 play];
    }
}

- (void)shakeAnimation
{
    _count++;
    if (_count%6 == 0) {
        CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        basicAnimation.fromValue = [NSNumber numberWithFloat:-M_PI/18.0];
        basicAnimation.toValue = [NSNumber numberWithFloat:+M_PI/18.0];
        
        basicAnimation.repeatCount = 4;
        basicAnimation.duration = 0.1;
        basicAnimation.autoreverses = YES;//是否重复
        
        CALayer *mylayer = [self.iphone layer];
        
        CGPoint oldAnchorPoint = mylayer.anchorPoint;
        
        [mylayer setAnchorPoint:CGPointMake(0.5, 1.0)];
        
        [mylayer setPosition:CGPointMake(mylayer.position.x + mylayer.bounds.size.width*(mylayer.anchorPoint.x - oldAnchorPoint.x), mylayer.position.y + mylayer.bounds.size.height*(mylayer.anchorPoint.y - oldAnchorPoint.y))];
        
        [self.iphone.layer addAnimation:basicAnimation forKey:@"shakeAnimation"];
        self.iphone.alpha = 1.0;
        
        
    }
}


@end
