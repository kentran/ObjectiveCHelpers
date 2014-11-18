//
//  UIView+Animation.h
//  LittleOnce
//
//  Created by Ken Tran on 16/7/14.
//  Copyright (c) 2014 LittleLives. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Animation)

/*!
 *  Make a UIView bounce
 *
 *  @param bounceFactor how much it should bounce
 */
- (void)bounce:(CGFloat)bounceFactor;

/*!
 *  Scale a UIView
 *
 *  @param firstFactor  initial scale
 *  @param secondFactor destination scale
 */
- (void)scaleFromFactor:(CGFloat)firstFactor toFactor:(CGFloat)secondFactor;

/*!
 *  Make a UIView larger then back to normal
 */
- (void)emphasize;

/*!
 *  Make a UIView start small then scale up to normal size
 */
- (void)zoomInToNormal;

/*!
 *  Animate UIView as being placed on
 */
- (void)placeBadge;

/*!
 *  Make a UIView shake
 *
 *  @param shakeFactor how much it should shake
 */
- (void)shake:(CGFloat)shakeFactor;

/*!
 *  Make a UIView float
 *
 *  @param floatFactor how big is the float radius
 */
- (void)floating:(CGFloat)floatFactor;

@end
