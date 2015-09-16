//
//  Info.h
//
//  Created by Roger TAN on 14/09/15
//  Copyright (c) 2015 Roger TAN. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Info : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *meta;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
