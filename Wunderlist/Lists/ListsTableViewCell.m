//
//  ListsTableViewCell.m
//  Wunderlist
//
//  Created by Chan Soon Park on 12. 9. 17..
//  Copyright (c) 2012년 Chan Soon Park. All rights reserved.
//

#import "ListsTableViewCell.h"

@implementation ListsTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSAutoreleasePool* pool = [NSAutoreleasePool new];
        
        [self setSelectionStyle:UITableViewCellEditingStyleNone];
        
        UILabel* countLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        [countLabel setText:@"7"];
        self.accessoryView = countLabel;
        [countLabel release];
        
        [pool drain];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
