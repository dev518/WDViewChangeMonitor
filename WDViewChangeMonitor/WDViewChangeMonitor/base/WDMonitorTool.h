//
//  WDMonitorTool.h
//  WDViewChangeMonitor
//
//  Created by wudi on 2018/10/29.
//  Copyright © 2018 wudi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WDMonitorTool : NSObject

+ (instancetype)sharedInstance;
- (void)monitorView:(UIView *)selectView;
- (void)showTraces;

@end

NS_ASSUME_NONNULL_END
