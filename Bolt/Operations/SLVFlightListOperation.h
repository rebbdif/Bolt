//
//  SLVFlightListOperation.h
//  Bolt
//
//  Created by 1 on 13.06.17.
//  Copyright © 2017 serebryanyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SLVNetworkDelegate.h"

@class SLVFlight;
@class SLVFlightsListModel;


@interface SLVFlightListOperation : NSOperation

- (instancetype)initWithModel:(SLVFlightsListModel *)model andNetworkDelegate:(id<SLVNetworkDelegate>)networkDelegate;

@end
