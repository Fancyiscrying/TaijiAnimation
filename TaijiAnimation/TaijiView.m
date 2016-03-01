//
//  TaijiView.m
//  TaijiAnimation
//
//  Created by Fancy on 16/2/29.
//  Copyright © 2016年 Fancy. All rights reserved.
//

#import "TaijiView.h"

@implementation TaijiView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (id)initWithFrame:(CGRect)frame
{

    self = [super initWithFrame:frame];
    if (self) {
        currentIndex = 0.0;
        //设置背景颜色
        self.backgroundColor = [UIColor clearColor];
        //创建定时器
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f/32.0f target:self selector:@selector(updateSpotlight) userInfo:nil repeats:YES];
    }
    return  self;
}

- (void)updateSpotlight
{
    
    currentIndex +=0.01;
    [self setNeedsDisplay];//重新绘制




}

- (void) drawRect:(CGRect)rect
{

    float x = self.frame.size.width/2;
    float y= self.frame.size.height/2;
    //获取半径
    float radius =self.frame.size.width/2;
    if (self.frame.size.width>self.frame.size.height) {
        radius = self.frame.size.height/2;
        
    }
    float runAngle = M_PI*currentIndex;//设置
    
    
    
    if (runAngle >=2*M_PI) {
        runAngle -= 2*M_PI;
    }
    CGContextRef context = UIGraphicsGetCurrentContext();//创建图像上下文
    //白色
    CGColorRef whiteColor =[[UIColor colorWithRed:1 green:1 blue:1 alpha:1] CGColor];
    //黑色
    CGColorRef blackColor =[[UIColor colorWithRed:0 green:0 blue:0 alpha:1] CGColor];
    //绘制半个白色的圆
    CGContextSetFillColor(context, CGColorGetComponents(whiteColor));
    
    CGContextAddArc(context, x, y ,radius, 0+runAngle, M_PI+runAngle, 0);
    
    CGContextClosePath(context);
    CGContextFillPath(context);
    
    CGContextSetFillColor(context, CGColorGetComponents( blackColor));
    CGContextAddArc(context, x, y, radius,  M_PI+runAngle, M_PI*2+runAngle, 0);
    CGContextClosePath(context);
    CGContextFillPath(context);
    
    
    CGContextSetFillColor(context, CGColorGetComponents( whiteColor));
    CGContextAddArc(context, x+radius/2*cos(runAngle)  , y+radius/2*sin(runAngle), radius/2,  M_PI+runAngle, M_PI*2+runAngle, 0);
    CGContextClosePath(context);
    CGContextFillPath(context);
    
    CGContextSetFillColor(context, CGColorGetComponents(blackColor));
    CGContextAddArc(context, x-radius/2*cos(runAngle), y-radius/2*sin(runAngle), radius/2,  0+runAngle, M_PI+runAngle, 0);
    CGContextClosePath(context);
    CGContextFillPath(context);
    
    CGContextSetStrokeColorWithColor(context, whiteColor);
    CGContextMoveToPoint(context, x+radius*cos(runAngle), y+radius*sin(runAngle));
    CGContextAddLineToPoint(context, x, y);
    CGContextStrokePath(context);
    
    CGContextSetStrokeColorWithColor(context, blackColor);
    CGContextMoveToPoint(context, x-radius*cos(runAngle), y-radius*sin(runAngle));
    CGContextAddLineToPoint(context, x, y);
    CGContextStrokePath(context);
    
    
    CGContextSetFillColor(context, CGColorGetComponents( whiteColor));
    CGContextAddArc(context, x-radius/2*cos(runAngle), y-radius/2*sin(runAngle), radius/4,  0, M_PI*2, 0);
    CGContextClosePath(context);
    CGContextFillPath(context);
    
    
    CGContextSetFillColor(context, CGColorGetComponents( blackColor));
    CGContextAddArc(context, x+radius/2*cos(runAngle), y+radius/2*sin(runAngle), radius/4,  0, M_PI*2, 0);
    CGContextClosePath(context);
    CGContextFillPath(context);
    
}

@end
