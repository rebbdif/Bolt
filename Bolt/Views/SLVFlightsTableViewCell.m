//
//  DIFFligthsTableViewCell.m
//  Bolt
//
//  Created by 1 on 01.05.17.
//  Copyright © 2017 serebryanyy. All rights reserved.
//

#import "SLVFlightsTableViewCell.h"
#import "UIFont+SLVFont.h"
#import "UIColor+SLVColor.h"

@implementation SLVFlightsTableViewCell

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configureCell];
    }
    return self;
}

- (void)configureCell {
    _title = [UILabel new];
    _title.font = [UIFont titleHelvetica];
    _title.adjustsFontSizeToFitWidth = YES;
    _title.textColor = [UIColor whiteColor];
    [self.contentView addSubview:_title];
    
    _flight = [UILabel new];
    _flight.font = [UIFont lightHelveticaLabels];
    _flight.textColor = [UIColor grayLabelColor];
    [self.contentView addSubview:_flight];
    
    _hotel = [UILabel new];
    _hotel.font = [UIFont lightHelveticaLabels];
    _hotel.textColor = [UIColor grayLabelColor];
    [self.contentView addSubview:_hotel];
    
    _dates = [UILabel new];
    _dates.font = [UIFont boldHelvetica];
    _dates.backgroundColor = [UIColor darkRedColor];
    _dates.layer.cornerRadius = 50;
    _dates.layer.borderColor = [UIColor grayColor].CGColor;
    _dates.layer.borderWidth = 1;
    [self.contentView addSubview:_dates];
}

- (void)updateConstraints {
    
    [super updateConstraints];
}

- (void)prepareForReuse {
    self.title.text = nil;
    self.hotel.text = nil;
    self.flight.text = nil;
    self.dates.text = nil;
}

@end
