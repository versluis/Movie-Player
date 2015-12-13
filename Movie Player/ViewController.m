//
//  ViewController.m
//  Movie Player
//
//  Created by Jay Versluis on 13/12/2015.
//  Copyright © 2015 Pinkstone Pictures LLC. All rights reserved.
//

#import "ViewController.h"
@import AVFoundation;
@import AVKit;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // grab a local URL to our video
    NSURL *videoURL = [[NSBundle mainBundle]URLForResource:@"video" withExtension:@"mp4"];
    
    // or use a remote URL
    // NSURL *videoURL = [NSURL URLWithString:@"https://fpdl.vimeocdn.com/vimeo-prod-skyfire-std-us/01/4440/5/147203742/446020536.mp4?token=566d8865_0x4f7dd335901c1ab42317c3d0b8d237db988c4e98&download=1&filename=Presenting+on+top+of+a+UISplitView+Controller+-+Part+1-HD.mp4"];
    
    // create an AVPlayer
    AVPlayer *player = [AVPlayer playerWithURL:videoURL];
    
    // create a player view controller
    AVPlayerViewController *controller = [[AVPlayerViewController alloc]init];
    controller.player = player;
    [player play];
    
    // show the view controller
    [self addChildViewController:controller];
    [self.view addSubview:controller.view];
    controller.view.frame = self.view.frame;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController*) topMostController {
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    while (topController.presentedViewController) {
        topController = topController.presentedViewController;
    }
    
    return topController;
}

@end
