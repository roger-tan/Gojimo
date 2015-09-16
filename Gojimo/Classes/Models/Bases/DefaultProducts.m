//
//  DefaultProducts.m
//
//  Created by Roger TAN on 14/09/15
//  Copyright (c) 2015 Roger TAN. All rights reserved.
//

#import "DefaultProducts.h"
#import "Assets.h"
#import "Publisher.h"


NSString *const kDefaultProductsAuthor = @"author";
NSString *const kDefaultProductsAssets = @"assets";
NSString *const kDefaultProductsId = @"id";
NSString *const kDefaultProductsTitle = @"title";
NSString *const kDefaultProductsIosIapId = @"ios_iap_id";
NSString *const kDefaultProductsLink = @"link";
NSString *const kDefaultProductsType = @"type";
NSString *const kDefaultProductsPublisher = @"publisher";
NSString *const kDefaultProductsStoreIds = @"store_ids";


@interface DefaultProducts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation DefaultProducts

@synthesize author = _author;
@synthesize assets = _assets;
@synthesize defaultProductsIdentifier = _defaultProductsIdentifier;
@synthesize title = _title;
@synthesize iosIapId = _iosIapId;
@synthesize link = _link;
@synthesize type = _type;
@synthesize publisher = _publisher;
@synthesize storeIds = _storeIds;


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
            self.author = [self objectOrNilForKey:kDefaultProductsAuthor fromDictionary:dict];
    NSObject *receivedAssets = [dict objectForKey:kDefaultProductsAssets];
    NSMutableArray *parsedAssets = [NSMutableArray array];
    if ([receivedAssets isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedAssets) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedAssets addObject:[Assets modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedAssets isKindOfClass:[NSDictionary class]]) {
       [parsedAssets addObject:[Assets modelObjectWithDictionary:(NSDictionary *)receivedAssets]];
    }

    self.assets = [NSArray arrayWithArray:parsedAssets];
            self.defaultProductsIdentifier = [self objectOrNilForKey:kDefaultProductsId fromDictionary:dict];
            self.title = [self objectOrNilForKey:kDefaultProductsTitle fromDictionary:dict];
            self.iosIapId = [self objectOrNilForKey:kDefaultProductsIosIapId fromDictionary:dict];
            self.link = [self objectOrNilForKey:kDefaultProductsLink fromDictionary:dict];
            self.type = [self objectOrNilForKey:kDefaultProductsType fromDictionary:dict];
            self.publisher = [Publisher modelObjectWithDictionary:[dict objectForKey:kDefaultProductsPublisher]];
            self.storeIds = [self objectOrNilForKey:kDefaultProductsStoreIds fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.author forKey:kDefaultProductsAuthor];
    NSMutableArray *tempArrayForAssets = [NSMutableArray array];
    for (NSObject *subArrayObject in self.assets) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAssets addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAssets addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAssets] forKey:kDefaultProductsAssets];
    [mutableDict setValue:self.defaultProductsIdentifier forKey:kDefaultProductsId];
    [mutableDict setValue:self.title forKey:kDefaultProductsTitle];
    [mutableDict setValue:self.iosIapId forKey:kDefaultProductsIosIapId];
    [mutableDict setValue:self.link forKey:kDefaultProductsLink];
    [mutableDict setValue:self.type forKey:kDefaultProductsType];
    [mutableDict setValue:[self.publisher dictionaryRepresentation] forKey:kDefaultProductsPublisher];
    NSMutableArray *tempArrayForStoreIds = [NSMutableArray array];
    for (NSObject *subArrayObject in self.storeIds) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForStoreIds addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForStoreIds addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForStoreIds] forKey:kDefaultProductsStoreIds];

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

    self.author = [aDecoder decodeObjectForKey:kDefaultProductsAuthor];
    self.assets = [aDecoder decodeObjectForKey:kDefaultProductsAssets];
    self.defaultProductsIdentifier = [aDecoder decodeObjectForKey:kDefaultProductsId];
    self.title = [aDecoder decodeObjectForKey:kDefaultProductsTitle];
    self.iosIapId = [aDecoder decodeObjectForKey:kDefaultProductsIosIapId];
    self.link = [aDecoder decodeObjectForKey:kDefaultProductsLink];
    self.type = [aDecoder decodeObjectForKey:kDefaultProductsType];
    self.publisher = [aDecoder decodeObjectForKey:kDefaultProductsPublisher];
    self.storeIds = [aDecoder decodeObjectForKey:kDefaultProductsStoreIds];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_author forKey:kDefaultProductsAuthor];
    [aCoder encodeObject:_assets forKey:kDefaultProductsAssets];
    [aCoder encodeObject:_defaultProductsIdentifier forKey:kDefaultProductsId];
    [aCoder encodeObject:_title forKey:kDefaultProductsTitle];
    [aCoder encodeObject:_iosIapId forKey:kDefaultProductsIosIapId];
    [aCoder encodeObject:_link forKey:kDefaultProductsLink];
    [aCoder encodeObject:_type forKey:kDefaultProductsType];
    [aCoder encodeObject:_publisher forKey:kDefaultProductsPublisher];
    [aCoder encodeObject:_storeIds forKey:kDefaultProductsStoreIds];
}

- (id)copyWithZone:(NSZone *)zone
{
    DefaultProducts *copy = [[DefaultProducts alloc] init];
    
    if (copy) {

        copy.author = [self.author copyWithZone:zone];
        copy.assets = [self.assets copyWithZone:zone];
        copy.defaultProductsIdentifier = [self.defaultProductsIdentifier copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.iosIapId = [self.iosIapId copyWithZone:zone];
        copy.link = [self.link copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.publisher = [self.publisher copyWithZone:zone];
        copy.storeIds = [self.storeIds copyWithZone:zone];
    }
    
    return copy;
}


@end
