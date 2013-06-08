//
//  ViewController.m
//  DoubleTapSample
//
//  Created by Dolice on 2013/06/08.
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign) BOOL singleTapReady;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    //画面がタッチされたらシングルタップフラグを解除
    _singleTapReady = NO;
}

- (void)touchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
    NSInteger tapCount = [[touches anyObject] tapCount];
    if (tapCount < 2) {
        //tapCountが 2より小さければシングルタップフラグを立てる
        _singleTapReady = YES;
        
        //singleTap確定メソッドを0.3秒後に遅延実行
        [self performSelector:@selector(singleTap:)
                   withObject:nil
                   afterDelay:0.3f];
    } else {
        //dabouleTap確定メソッドを実行
        [self performSelector:@selector(doubleTap)];
    }
    
}

- (void)singleTap:(id)selector
{
    //他の touchesBeganが呼ばれていたらキャンセル
    if (!_singleTapReady) {
        return;
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:@"Single Tap!"
                                                   delegate:nil
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"OK", nil];
    [alert show];
}

- (void)doubleTap
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:@"Double Tap!!"
                                                   delegate:nil
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"OK", nil];
    [alert show];
}

@end
