//
//  Publisher.m
//
//  Created by Roger TAN on 14/09/15
//  Copyright (c) 2015 Roger TAN. All rights reserved.
//

#import "Publisher.h"


NSString *const kPublisherId = @"id";
NSString *const kPublisherTitle = @"title";
NSString *const kPublisherLink = @"link";


@interface Publisher ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Publisher

@synthesize publisherIdentifier = _publisherIdentifier;
@synthesize title = _title;
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
            self.publisherIdentifier = [self objectOrNilForKey:kPublisherId fromDictionary:dict];
            self.title = [self objectOrNilForKey:kPublisherTitle fromDictionary:dict];
            self.link = [self objectOrNilForKey:kPublisherLink fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.publisherIdentifier forKey:kPublisherId];
    [mutableDict setValue:self.title forKey:kPublisherTitle];
    [mutableDict setValue:self.link forKey:kPublisherLink];

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

    self.publisherIdentifier = [aDecoder decodeObjectForKey:kPublisherId];
    self.title = [aDecoder decodeObjectForKey:kPublisherTitle];
    self.link = [aDecoder decodeObjectForKey:kPublisherLink];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_publisherIdentifier forKey:kPublisherId];
    [aCoder encodeObject:_title forKey:kPublisherTitle];
    [aCoder encodeObject:_link forKey:kPublisherLink];
}

- (id)copyWithZone:(NSZone *)zone
{
    Publisher *copy = [[Publisher alloc] init];
    
    if (copy) {

        copy.publisherIdentifier = [self.publisherIdentifier copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.link = [self.link copyWithZone:zone];
    }
    
    return copy;
}


@end
