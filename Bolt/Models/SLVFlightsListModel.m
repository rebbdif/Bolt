//
//  DIFFlightsListModel.m
//  Bolt
//
//  Created by 1 on 01.05.17.
//  Copyright © 2017 serebryanyy. All rights reserved.
//

#import "SLVFlightsListModel.h"
#import "SLVFlight.h"
#import "SLVFlightListOperation.h"

@interface SLVFlightsListModel()

@property (nonatomic, strong) id<SLVNetworkDelegate> networkDelegate;
@property (nonatomic, copy) NSArray<SLVFlight *> *flights;
@property (nonatomic, strong) NSMutableDictionary<NSNumber *, SLVFlightListOperation *> *operations;

@end

@implementation SLVFlightsListModel

- (instancetype)initWithNetworkDelegate:(id<SLVNetworkDelegate>)networkDelegate {
    self = [super init];
    if (self) {
        _networkDelegate = networkDelegate;
        _flights = [NSArray new];
        _operations = [NSMutableDictionary new];
    }
    return self;
}

#pragma mark = SLVProviderProtocol

- (id)itemForRow:(NSUInteger)row {
    return self.flights[row];
}

- (NSUInteger)numberOfItems {
    return self.flights.count;
}

- (void)getItemsWIthCompletionBlock:(void (^)(void))completionBlock {
    SLVFlightListOperation *downloadOperation = [[SLVFlightListOperation alloc] initWithModel:self andNetworkDelegate:self.networkDelegate];
    downloadOperation.completionBlock = completionBlock;
    NSOperationQueue *queue = [NSOperationQueue new];
    queue.qualityOfService = NSQualityOfServiceDefault;
    [queue addOperation:downloadOperation];
}

- (void)parseFlights:(NSDictionary *)data {
    NSMutableArray *newFlights = [NSMutableArray new];
    for (NSDictionary* route in data[@"Quotes"]) {
        [newFlights addObject:[SLVFlight flightWithDictionary:route]];
    }
    self.flights = [self.flights arrayByAddingObjectsFromArray:newFlights];
}

- (void)parseHotels:(NSDictionary *)data {
    
}


@end
