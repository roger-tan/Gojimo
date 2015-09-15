//
//  Assets.h
//
//  Created by Roger TAN on 14/09/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Assets : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) id unzippedBaseUrl;
@property (nonatomic, strong) NSArray *info;
@property (nonatomic, strong) NSString *assetsIdentifier;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, assign) id copyright;
@property (nonatomic, strong) NSString *link;
@property (nonatomic, assign) id meta;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, strong) NSString *path;
@property (nonatomic, assign) double size;
@property (nonatomic, strong) NSString *contentType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
