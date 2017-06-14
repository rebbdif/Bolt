//
//  SLVProviderProtocol.h
//  Bolt
//
//  Created by 1 on 13.06.17.
//  Copyright © 2017 serebryanyy. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SLVProviderProtocol <NSObject>

- (id)itemForRow:(NSUInteger)row;
- (NSUInteger)numberOfItems;
- (void)getItemsWIthCompletionBlock:(void (^)(void))completionBlock;

@end
