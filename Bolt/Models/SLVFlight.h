//
//  SLVFlightModel.h
//  Bolt
//
//  Created by 1 on 01.05.17.
//  Copyright © 2017 serebryanyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SLVFlight : NSObject

@property (nonatomic, strong) NSString *destination;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSString *departureDate;
@property (nonatomic, strong) NSString *arrivalDate;

+ (SLVFlight *)flightWithDictionary:(NSDictionary *)parameters;

@end
