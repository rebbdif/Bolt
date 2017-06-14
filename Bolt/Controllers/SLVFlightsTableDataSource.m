//
//  SLVFlightsTableDataProvider.m
//  Bolt
//
//  Created by 1 on 13.06.17.
//  Copyright © 2017 serebryanyy. All rights reserved.
//

#import "SLVFlightsTableDataSource.h"
#import "SLVFlightsTableViewCell.h"
#import "SLVFlight.h"

static NSString *const SLVFligthsTableViewCellReuseIdentifier = @"SLVFligthsTableViewCell";

@interface SLVFlightsTableDataSource() <UITableViewDataSource>

@property (nonatomic, strong) id<SLVProviderProtocol> model;

@end

@implementation SLVFlightsTableDataSource

- (instancetype)initWithModel:(id<SLVProviderProtocol>)model {
    self = [super init];
    if (self) {
        _model = model;
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.model numberOfItems];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SLVFlightsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SLVFligthsTableViewCellReuseIdentifier];
    SLVFlight *currentFlight = [self.model itemForRow:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"Destination: %@", currentFlight.destination];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Price: %@", currentFlight.price];
    return cell;
}



@end
