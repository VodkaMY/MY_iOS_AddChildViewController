//
//  MYTitleButton.m
//  MaoYan
//
//  Created by MaoYan on 16/6/30.
//  Copyright © 2016年 Onwer. All rights reserved.
//

#import "MYTitleButton.h"

@implementation MYTitleButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.font = [UIFont systemFontOfSize:15 weight:0.00001];
    }
    return self;
}
-(void)setHighlighted:(BOOL)highlighted{}

@end
