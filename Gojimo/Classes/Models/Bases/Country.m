//
//  Country.m
//
//  Created by Roger TAN on 14/09/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "Country.h"


NSString *const kCountryCode = @"code";
NSString *const kCountryLink = @"link";
NSString *const kCountryUpdatedAt = @"updated_at";
NSString *const kCountryName = @"name";
NSString *const kCountryCreatedAt = @"created_at";


@interface Country ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Country

@synthesize code = _code;
@synthesize link = _link;
@synthesize updatedAt = _updatedAt;
@synthesize name = _name;
@synthesize createdAt = _createdAt;


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
            self.code = [self objectOrNilForKey:kCountryCode fromDictionary:dict];
            self.link = [self objectOrNilForKey:kCountryLink fromDictionary:dict];
            self.updatedAt = [self objectOrNilForKey:kCountryUpdatedAt fromDictionary:dict];
            self.name = [self objectOrNilForKey:kCountryName fromDictionary:dict];
            self.createdAt = [self objectOrNilForKey:kCountryCreatedAt fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.code forKey:kCountryCode];
    [mutableDict setValue:self.link forKey:kCountryLink];
    [mutableDict setValue:self.updatedAt forKey:kCountryUpdatedAt];
    [mutableDict setValue:self.name forKey:kCountryName];
    [mutableDict setValue:self.createdAt forKey:kCountryCreatedAt];

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

    self.code = [aDecoder decodeObjectForKey:kCountryCode];
    self.link = [aDecoder decodeObjectForKey:kCountryLink];
    self.updatedAt = [aDecoder decodeObjectForKey:kCountryUpdatedAt];
    self.name = [aDecoder decodeObjectForKey:kCountryName];
    self.createdAt = [aDecoder decodeObjectForKey:kCountryCreatedAt];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_code forKey:kCountryCode];
    [aCoder encodeObject:_link forKey:kCountryLink];
    [aCoder encodeObject:_updatedAt forKey:kCountryUpdatedAt];
    [aCoder encodeObject:_name forKey:kCountryName];
    [aCoder encodeObject:_createdAt forKey:kCountryCreatedAt];
}

- (id)copyWithZone:(NSZone *)zone
{
    Country *copy = [[Country alloc] init];
    
    if (copy) {

        copy.code = [self.code copyWithZone:zone];
        copy.link = [self.link copyWithZone:zone];
        copy.updatedAt = [self.updatedAt copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.createdAt = [self.createdAt copyWithZone:zone];
    }
    
    return copy;
}


@end
