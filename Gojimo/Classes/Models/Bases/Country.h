//
//  Country.h
//
//  Created by Roger TAN on 14/09/15
//  Copyright (c) 2015 Roger TAN. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Country : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *createdAt;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
