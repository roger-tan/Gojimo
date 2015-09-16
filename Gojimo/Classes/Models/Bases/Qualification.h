//
//  Qualification.h
//
//  Created by Roger TAN on 14/09/15
//  Copyright (c) 2015 Roger TAN. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Country;

@interface Qualification : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *internalBaseClassIdentifier;
@property (nonatomic, strong) Country *country;
@property (nonatomic, strong) NSArray *defaultProducts;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *subjects;
@property (nonatomic, strong) NSString *link;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
