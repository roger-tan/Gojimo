//
//  DefaultProducts.h
//
//  Created by Roger TAN on 14/09/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Publisher;

@interface DefaultProducts : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSArray *assets;
@property (nonatomic, strong) NSString *defaultProductsIdentifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *iosIapId;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) Publisher *publisher;
@property (nonatomic, strong) NSArray *storeIds;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
