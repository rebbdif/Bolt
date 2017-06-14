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
    flight.flightPrice = [NSString stringWithFormat:@"%@", parameters[@"MinPrice"]];
    NSDictionary *outboundLeg = parameters[@"OutboundLeg"];
    flight.destination = [NSString stringWithFormat: @"%@", outboundLeg[@"DestinationId"]];
    flight.departureDate = [NSString stringWithFormat:@"%@", outboundLeg[@"DepartureDate"]];
    NSDictionary *inboundLeg = parameters[@"InboundLeg"];
    flight.arrivalDate = [NSString stringWithFormat:@"%@", inboundLeg[@"DepartureDate"]];
    flight.hotelPrice = @"990";
    return flight;
}

@end
