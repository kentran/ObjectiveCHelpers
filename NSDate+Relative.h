//
//  NSDate+Relative.h
//  LittleOnce
//
//  Created by Ken Tran on 4/9/14.
//  Copyright (c) 2014 LittleLives. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Relative)

/*!
 *  Get the relative from present to the date specified by the instance
 *
 *  @return "never", "less than a minute ago", "... minutes ago", "... days ago", "... months ago"
 */
- (NSString *)relativeFromCurrentDate;

@end
