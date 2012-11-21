//
//  DetailTableViewCell.h
//  Wunderlist
//
//  Created by Chan Soon Park on 12. 9. 24..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DetailTableViewCellStyle) {
    DetailTableViewCellStyleTitle,
    DetailTableViewCellStyleValue1,
    DetailTableViewCellStyleSwitch
};

@interface DetailTableViewCell : UITableViewCell

- (id)initWithStyle:(DetailTableViewCellStyle)customStyle reuseIdentifier:(NSString *)reuseIdentifier;

- (void)initStyleTitle;
- (void)initStyleValue1;
- (void)initStyleSwitch;

@end
