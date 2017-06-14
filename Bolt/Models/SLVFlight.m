//
//  SLVFlightModel.m
//  Bolt
//
//  Created by 1 on 01.05.17.
//  Copyright © 2017 serebryanyy. All rights reserved.
//

#import "SLVFlight.h"


@implementation SLVFlight

+ (SLVFlight *)flightWithDictionary:(NSDictionary *)parameters {
    SLVFlight *flight = [SLVFlight new];
    flight.price = parameters[@"MinPrice"];
    NSDictionary *outboundLeg = parameters[@"OutboundLeg"];
    flight.destination = outboundLeg[@"DestinationId"];
    flight.departureDate = outboundLeg[@"DepartureDate"];
    NSDictionary *inboundLeg = parameters[@"InboundLeg"];
    flight.arrivalDate = inboundLeg[@"DepartureDate"];
    return flight;
}

@end
