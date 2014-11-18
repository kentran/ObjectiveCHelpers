//
//  NSDate+Relative.m
//  LittleOnce
//
//  Created by Ken Tran on 4/9/14.
//  Copyright (c) 2014 LittleLives. All rights reserved.
//

#import "NSDate+Relative.h"

@implementation NSDate (Relative)

- (NSString *)relativeFromCurrentDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm a"];
    
    NSDate *todayDate = [NSDate date];
    double ti = [self timeIntervalSinceDate:todayDate];
    ti = ti * -1;
    if(ti < 1) {
    	return @"never";
    } else 	if (ti < 60) {
    	return @"less than a minute ago";
    } else if (ti < 3600) {
    	int diff = round(ti / 60);
    	return [NSString stringWithFormat:@"%d minutes ago", diff];
    } else if (ti < 86400) {
        /* Within a day */
    	int diff = round(ti / 60 / 60);
        if (diff < 12) {
            return [NSString stringWithFormat:@"%d hours ago", diff];
        } else {
            return [NSString stringWithFormat:@"Today, at %@", [formatter stringFromDate:self]];
        }
    } else if (ti < 2629743) {
    	int diff = round(ti / 60 / 60 / 24);
        if (diff == 1) {
            /* Yesterday */
            return [NSString stringWithFormat:@"Yesterday, at %@", [formatter stringFromDate:self]];
        } else if (diff < 7) {
            /* Within a week */
            [formatter setDateFormat:@"EEEE, hh:mm a"];
            return [NSString stringWithFormat:@"%@", [formatter stringFromDate:self]];
        } else {
            /* More than a week, within a month */
            [formatter setDateFormat:@"MMMM dd, 'at' HH:mm a"];
            return [NSString stringWithFormat:@"%@", [formatter stringFromDate:self]];
        }
    } else {
        /* More than a month */
        int diff = round(ti / 60 / 60 / 24 / 30);
        if (diff < 12) {
            [formatter setDateFormat:@"MMMM dd, 'at' HH:mm a"];
            return [NSString stringWithFormat:@"%@", [formatter stringFromDate:self]];
        } else {
            return [NSString stringWithFormat:@"%d months ago", diff];
        }
    }
}

@end
