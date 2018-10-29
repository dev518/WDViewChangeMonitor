//
//  WDMonitorTool.m
//  WDViewChangeMonitor
//
//  Created by wudi on 2018/10/29.
//  Copyright © 2018 wudi. All rights reserved.
//

#import "WDMonitorTool.h"

@interface WDMonitorTool()
@property(nonatomic, weak) UIView *selectView;
@property(nonatomic, strong) NSMutableDictionary *traceInfo;
@property(nonatomic, assign) NSInteger selectTrace;

@end

@implementation WDMonitorTool

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static WDMonitorTool *instance = nil;
    dispatch_once(&onceToken,^{
        instance = [WDMonitorTool new];
    });
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.traceInfo = [NSMutableDictionary new];
        self.selectTrace = -1;
    }
    return self;
}

- (void)monitorView:(UIView *)selectView{
    _selectView = selectView;
    [_selectView addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    [self traceForWatchObj:object traceInfo:change[@"new"]];
    
}

- (void)traceForWatchObj:(UIView *)view traceInfo:(NSObject *)traceInfo{
    NSMutableArray *muArr = (NSMutableArray *)self.traceInfo[@"traces"];
    if (!muArr) {
        muArr = [NSMutableArray new];
        [self.traceInfo setObject:view forKey:@"traceObj"];
    }
    if (muArr.count == self.selectTrace) {
        [NSThread sleepForTimeInterval:5];
    }
    [muArr addObject:traceInfo];
    [self.traceInfo setObject:muArr forKey:@"traces"];
}

- (void)showTraces{
    

}


- (void)clearTraces{
    self.selectTrace = -1;
    self.traceInfo = [NSMutableDictionary new];
}
@end
