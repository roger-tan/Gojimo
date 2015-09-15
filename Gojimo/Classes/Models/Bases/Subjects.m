//
//  Subjects.m
//
//  Created by Roger TAN on 14/09/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "Subjects.h"


NSString *const kSubjectsId = @"id";
NSString *const kSubjectsTitle = @"title";
NSString *const kSubjectsColour = @"colour";
NSString *const kSubjectsLink = @"link";


@interface Subjects ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Subjects

@synthesize subjectsIdentifier = _subjectsIdentifier;
@synthesize title = _title;
@synthesize colour = _colour;
@synthesize link = _link;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.subjectsIdentifier = [self objectOrNilForKey:kSubjectsId fromDictionary:dict];
            self.title = [self objectOrNilForKey:kSubjectsTitle fromDictionary:dict];
            self.colour = [self objectOrNilForKey:kSubjectsColour fromDictionary:dict];
            self.link = [self objectOrNilForKey:kSubjectsLink fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.subjectsIdentifier forKey:kSubjectsId];
    [mutableDict setValue:self.title forKey:kSubjectsTitle];
    [mutableDict setValue:self.colour forKey:kSubjectsColour];
    [mutableDict setValue:self.link forKey:kSubjectsLink];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.subjectsIdentifier = [aDecoder decodeObjectForKey:kSubjectsId];
    self.title = [aDecoder decodeObjectForKey:kSubjectsTitle];
    self.colour = [aDecoder decodeObjectForKey:kSubjectsColour];
    self.link = [aDecoder decodeObjectForKey:kSubjectsLink];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_subjectsIdentifier forKey:kSubjectsId];
    [aCoder encodeObject:_title forKey:kSubjectsTitle];
    [aCoder encodeObject:_colour forKey:kSubjectsColour];
    [aCoder encodeObject:_link forKey:kSubjectsLink];
}

- (id)copyWithZone:(NSZone *)zone
{
    Subjects *copy = [[Subjects alloc] init];
    
    if (copy) {

        copy.subjectsIdentifier = [self.subjectsIdentifier copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.colour = [self.colour copyWithZone:zone];
        copy.link = [self.link copyWithZone:zone];
    }
    
    return copy;
}


@end
