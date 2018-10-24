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
@interface ViewController ()

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

@end
