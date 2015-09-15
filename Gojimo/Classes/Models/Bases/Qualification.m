//
//  Qualification.m
//
//  Created by Roger TAN on 14/09/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "Qualification.h"
#import "Country.h"
#import "DefaultProducts.h"


NSString *const kQualificationId = @"id";
NSString *const kQualificationCountry = @"country";
NSString *const kQualificationDefaultProducts = @"default_products";
NSString *const kQualificationName = @"name";
NSString *const kQualificationSubjects = @"subjects";
NSString *const kQualificationLink = @"link";


@interface Qualification ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Qualification

@synthesize internalBaseClassIdentifier = _internalBaseClassIdentifier;
@synthesize country = _country;
@synthesize defaultProducts = _defaultProducts;
@synthesize name = _name;
@synthesize subjects = _subjects;
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
            self.internalBaseClassIdentifier = [self objectOrNilForKey:kQualificationId fromDictionary:dict];
            self.country = [Country modelObjectWithDictionary:[dict objectForKey:kQualificationCountry]];
    NSObject *receivedDefaultProducts = [dict objectForKey:kQualificationDefaultProducts];
    NSMutableArray *parsedDefaultProducts = [NSMutableArray array];
    if ([receivedDefaultProducts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedDefaultProducts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedDefaultProducts addObject:[DefaultProducts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedDefaultProducts isKindOfClass:[NSDictionary class]]) {
       [parsedDefaultProducts addObject:[DefaultProducts modelObjectWithDictionary:(NSDictionary *)receivedDefaultProducts]];
    }

    self.defaultProducts = [NSArray arrayWithArray:parsedDefaultProducts];
            self.name = [self objectOrNilForKey:kQualificationName fromDictionary:dict];
            self.subjects = [self objectOrNilForKey:kQualificationSubjects fromDictionary:dict];
            self.link = [self objectOrNilForKey:kQualificationLink fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.internalBaseClassIdentifier forKey:kQualificationId];
    [mutableDict setValue:[self.country dictionaryRepresentation] forKey:kQualificationCountry];
    NSMutableArray *tempArrayForDefaultProducts = [NSMutableArray array];
    for (NSObject *subArrayObject in self.defaultProducts) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForDefaultProducts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForDefaultProducts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForDefaultProducts] forKey:kQualificationDefaultProducts];
    [mutableDict setValue:self.name forKey:kQualificationName];
    NSMutableArray *tempArrayForSubjects = [NSMutableArray array];
    for (NSObject *subArrayObject in self.subjects) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSubjects addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSubjects addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSubjects] forKey:kQualificationSubjects];
    [mutableDict setValue:self.link forKey:kQualificationLink];

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

    self.internalBaseClassIdentifier = [aDecoder decodeObjectForKey:kQualificationId];
    self.country = [aDecoder decodeObjectForKey:kQualificationCountry];
    self.defaultProducts = [aDecoder decodeObjectForKey:kQualificationDefaultProducts];
    self.name = [aDecoder decodeObjectForKey:kQualificationName];
    self.subjects = [aDecoder decodeObjectForKey:kQualificationSubjects];
    self.link = [aDecoder decodeObjectForKey:kQualificationLink];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_internalBaseClassIdentifier forKey:kQualificationId];
    [aCoder encodeObject:_country forKey:kQualificationCountry];
    [aCoder encodeObject:_defaultProducts forKey:kQualificationDefaultProducts];
    [aCoder encodeObject:_name forKey:kQualificationName];
    [aCoder encodeObject:_subjects forKey:kQualificationSubjects];
    [aCoder encodeObject:_link forKey:kQualificationLink];
}

- (id)copyWithZone:(NSZone *)zone
{
    Qualification *copy = [[Qualification alloc] init];
    
    if (copy) {

        copy.internalBaseClassIdentifier = [self.internalBaseClassIdentifier copyWithZone:zone];
        copy.country = [self.country copyWithZone:zone];
        copy.defaultProducts = [self.defaultProducts copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.subjects = [self.subjects copyWithZone:zone];
        copy.link = [self.link copyWithZone:zone];
    }
    
    return copy;
}


@end
