//
//  Subjects.h
//
//  Created by Roger TAN on 14/09/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Subjects : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *subjectsIdentifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) id colour;
@property (nonatomic, strong) NSString *link;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
