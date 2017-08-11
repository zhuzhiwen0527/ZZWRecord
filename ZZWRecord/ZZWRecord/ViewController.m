//
//  ViewController.m
//  ZZWRecord
//
//  Created by zzw on 2017/8/11.
//  Copyright © 2017年 zzw. All rights reserved.
//

#import "ViewController.h"
#import "ZZWScressRecorder.h"
@interface ViewController ()
{
    NSTimer * _timer;
}
@property (weak, nonatomic) IBOutlet UILabel *lab;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _timer =  [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(change) userInfo:nil repeats:YES];
      [_timer setFireDate:[NSDate distantFuture]];
   
}
- (void)change{

    self.lab.text = [NSString stringWithFormat:@"%d",arc4random()%100];
    
}
- (IBAction)recordVideo:(UIButton *)sender {
    
    if (!sender.selected) {
        
        [[ZZWScressRecorder share] startRecording];
        [_timer setFireDate:[NSDate distantPast]];
    }else{
        
        [[ZZWScressRecorder share]
         stopRecordingWithCompletion:^{
            NSLog(@"录制完成");
        }];
         [_timer setFireDate:[NSDate distantFuture]];
      
    }
    sender.selected = !sender.selected;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
