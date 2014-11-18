//
//  UIView+Animation.m
//  LittleOnce
//
//  Created by Ken Tran on 16/7/14.
//  Copyright (c) 2014 LittleLives. All rights reserved.
//

#import "UIView+Animation.h"

@implementation UIView (Animation)

+ (CAKeyframeAnimation *)dockBounceAnimationWithViewHeight:(CGFloat)viewHeight
{
    NSInteger const kNumFactors = 22;
    CGFloat const kFactorsPerSec = 50.0f;
    CGFloat const kFactorsMaxValue = 128.0f;
    CGFloat factors[kNumFactors] = {0,  60, 83, 100, 114, 124, 128, 128, 124, 114, 100, 83, 60, 32, 0, 0, 18, 28, 32, 28, 18, 0};
    
    NSMutableArray *transforms = [[NSMutableArray alloc] init];
    
    for(NSUInteger i = 0; i < kNumFactors; i++) {
        CGFloat positionOffset  = factors[i] / kFactorsMaxValue * viewHeight;
        CATransform3D transform = CATransform3DMakeTranslation(0.0f, -positionOffset, 0.0f);
        
        [transforms addObject:[NSValue valueWithCATransform3D:transform]];
    }
    
    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.repeatCount           = 1;
    animation.duration              = kNumFactors * 1.0f/kFactorsPerSec;
    animation.fillMode              = kCAFillModeForwards;
    animation.values                = transforms;
    animation.removedOnCompletion   = YES; // final stage is equal to starting stage
    animation.autoreverses          = NO;
    
    return animation;
}

- (void)bounce:(CGFloat)bounceFactor
{
    CGFloat midHeight = self.frame.size.height * bounceFactor;
    CAKeyframeAnimation* animation = [[self class] dockBounceAnimationWithViewHeight:midHeight];
    [self.layer addAnimation:animation forKey:@"bouncing"];
}

- (void)scaleFromFactor:(CGFloat)firstFactor toFactor:(CGFloat)secondFactor
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    // Set the initial and the final values
    [animation setFromValue:[NSNumber numberWithFloat:firstFactor]];
    [animation setToValue:[NSNumber numberWithFloat:secondFactor]];
    
    // Set duration
    [animation setDuration:0.5f];
    
    // Set animation to be consistent on completion
    [animation setRemovedOnCompletion:NO];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    
    // Add animation to the view's layer
    [[self layer] addAnimation:animation forKey:@"scale"];
}

- (void)emphasize
{
    [self scaleFromFactor:0.0f toFactor:1.2f];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self scaleFromFactor:1.2f toFactor:1.0f];
    });
}

- (void)zoomInToNormal
{
    self.layer.transform = CATransform3DMakeScale(0.5, 0.5, 1);
    [UIView animateWithDuration:0.25 animations:^{
        self.layer.transform = CATransform3DMakeScale(1, 1, 1);
    }];
}

- (void)placeBadge
{
    self.layer.transform = CATransform3DMakeScale(2, 2, 2);
    [UIView animateWithDuration:0.5 animations:^{
        self.layer.transform = CATransform3DMakeScale(1, 1, 1);
    }];
}

- (void)shake:(CGFloat)shakeFactor
{
    CAKeyframeAnimation * animation = [ CAKeyframeAnimation animationWithKeyPath:@"transform" ] ;
    animation.values = @[ [ NSValue valueWithCATransform3D:CATransform3DMakeTranslation(-1 * shakeFactor, 0.0f, 0.0f) ],
                          [ NSValue valueWithCATransform3D:CATransform3DMakeTranslation(shakeFactor, 0.0f, 0.0f) ] ] ;
    animation.autoreverses = YES ;
    animation.repeatCount = 2.0f ;
    animation.duration = 0.07f ;
    
    [self.layer addAnimation:animation forKey:nil];
}

- (void)floating:(CGFloat)floatFactor
{
    CAKeyframeAnimation * animation = [ CAKeyframeAnimation animationWithKeyPath:@"transform" ] ;
    animation.values = @[ [ NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0.0f, -1 * floatFactor, 0.0f) ],
                          [ NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0.0f, floatFactor, 0.0f) ] ] ;
    animation.autoreverses = YES ;
    animation.repeatCount = HUGE_VALF ;
    animation.duration = 0.8f ;
    
    [self.layer addAnimation:animation forKey:nil];
}

@end
