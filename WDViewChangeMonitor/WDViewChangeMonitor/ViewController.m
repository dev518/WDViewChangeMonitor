//
//  ViewController.m
//  WDViewChangeMonitor
//
//  Created by wudi on 2018/10/23.
//  Copyright © 2018 wudi. All rights reserved.
//

#import "ViewController.h"
#ifdef DEBUG
#import "FLEXManager.h"
#endif
#import "WDMonitorTool.h"
@interface ViewController ()
@property(nonatomic, strong) UILabel *testLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)flexBtnClicked:(id)sender {
    
}

- (IBAction)flexSwitchChaged:(id)sender {
#ifdef DEBUG
    if (((UISwitch *)sender).isOn) {
        [[FLEXManager sharedManager] showExplorer];
    }else{
        [[FLEXManager sharedManager] hideExplorer];
    }
#endif

}
- (IBAction)testBtnClicked:(id)sender {
    CGRect frame = self.testLabel.frame;
    frame.origin.y += 20;
    self.testLabel.frame = frame;
}
- (IBAction)showBtnClicked:(id)sender {
    [[WDMonitorTool sharedInstance] showTraces];
}

- (UILabel *)testLabel{
    if (!_testLabel) {
        _testLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 100, 100, 50)];
        _testLabel.backgroundColor = [UIColor redColor];
        [self.view addSubview:_testLabel];
    }
    return _testLabel;
}

@end
