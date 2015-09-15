//
//  Assets.m
//
//  Created by Roger TAN on 14/09/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "Assets.h"
#import "Info.h"

NSString *const kAssetsUnzippedBaseUrl = @"unzipped_base_url";
NSString *const kAssetsInfo = @"info";
NSString *const kAssetsId = @"id";
NSString *const kAssetsCreatedAt = @"created_at";
NSString *const kAssetsCopyright = @"copyright";
NSString *const kAssetsLink = @"link";
NSString *const kAssetsMeta = @"meta";
NSString *const kAssetsUpdatedAt = @"updated_at";
NSString *const kAssetsPath = @"path";
NSString *const kAssetsSize = @"size";
NSString *const kAssetsContentType = @"content_type";


@interface Assets ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Assets

@synthesize unzippedBaseUrl = _unzippedBaseUrl;
@synthesize info = _info;
@synthesize assetsIdentifier = _assetsIdentifier;
@synthesize createdAt = _createdAt;
@synthesize copyright = _copyright;
@synthesize link = _link;
@synthesize meta = _meta;
@synthesize updatedAt = _updatedAt;
@synthesize path = _path;
@synthesize size = _size;
@synthesize contentType = _contentType;


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
            self.unzippedBaseUrl = [self objectOrNilForKey:kAssetsUnzippedBaseUrl fromDictionary:dict];
    NSObject *receivedInfo = [dict objectForKey:kAssetsInfo];
    NSMutableArray *parsedInfo = [NSMutableArray array];
    if ([receivedInfo isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedInfo) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedInfo addObject:[Info modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedInfo isKindOfClass:[NSDictionary class]]) {
       [parsedInfo addObject:[Info modelObjectWithDictionary:(NSDictionary *)receivedInfo]];
    }

    self.info = [NSArray arrayWithArray:parsedInfo];
            self.assetsIdentifier = [self objectOrNilForKey:kAssetsId fromDictionary:dict];
            self.createdAt = [self objectOrNilForKey:kAssetsCreatedAt fromDictionary:dict];
            self.copyright = [self objectOrNilForKey:kAssetsCopyright fromDictionary:dict];
            self.link = [self objectOrNilForKey:kAssetsLink fromDictionary:dict];
            self.meta = [self objectOrNilForKey:kAssetsMeta fromDictionary:dict];
            self.updatedAt = [self objectOrNilForKey:kAssetsUpdatedAt fromDictionary:dict];
            self.path = [self objectOrNilForKey:kAssetsPath fromDictionary:dict];
            self.size = [[self objectOrNilForKey:kAssetsSize fromDictionary:dict] doubleValue];
            self.contentType = [self objectOrNilForKey:kAssetsContentType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.unzippedBaseUrl forKey:kAssetsUnzippedBaseUrl];
    NSMutableArray *tempArrayForInfo = [NSMutableArray array];
    for (NSObject *subArrayObject in self.info) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForInfo addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForInfo addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForInfo] forKey:kAssetsInfo];
    [mutableDict setValue:self.assetsIdentifier forKey:kAssetsId];
    [mutableDict setValue:self.createdAt forKey:kAssetsCreatedAt];
    [mutableDict setValue:self.copyright forKey:kAssetsCopyright];
    [mutableDict setValue:self.link forKey:kAssetsLink];
    [mutableDict setValue:self.meta forKey:kAssetsMeta];
    [mutableDict setValue:self.updatedAt forKey:kAssetsUpdatedAt];
    [mutableDict setValue:self.path forKey:kAssetsPath];
    [mutableDict setValue:[NSNumber numberWithDouble:self.size] forKey:kAssetsSize];
    [mutableDict setValue:self.contentType forKey:kAssetsContentType];

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

    self.unzippedBaseUrl = [aDecoder decodeObjectForKey:kAssetsUnzippedBaseUrl];
    self.info = [aDecoder decodeObjectForKey:kAssetsInfo];
    self.assetsIdentifier = [aDecoder decodeObjectForKey:kAssetsId];
    self.createdAt = [aDecoder decodeObjectForKey:kAssetsCreatedAt];
    self.copyright = [aDecoder decodeObjectForKey:kAssetsCopyright];
    self.link = [aDecoder decodeObjectForKey:kAssetsLink];
    self.meta = [aDecoder decodeObjectForKey:kAssetsMeta];
    self.updatedAt = [aDecoder decodeObjectForKey:kAssetsUpdatedAt];
    self.path = [aDecoder decodeObjectForKey:kAssetsPath];
    self.size = [aDecoder decodeDoubleForKey:kAssetsSize];
    self.contentType = [aDecoder decodeObjectForKey:kAssetsContentType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_unzippedBaseUrl forKey:kAssetsUnzippedBaseUrl];
    [aCoder encodeObject:_info forKey:kAssetsInfo];
    [aCoder encodeObject:_assetsIdentifier forKey:kAssetsId];
    [aCoder encodeObject:_createdAt forKey:kAssetsCreatedAt];
    [aCoder encodeObject:_copyright forKey:kAssetsCopyright];
    [aCoder encodeObject:_link forKey:kAssetsLink];
    [aCoder encodeObject:_meta forKey:kAssetsMeta];
    [aCoder encodeObject:_updatedAt forKey:kAssetsUpdatedAt];
    [aCoder encodeObject:_path forKey:kAssetsPath];
    [aCoder encodeDouble:_size forKey:kAssetsSize];
    [aCoder encodeObject:_contentType forKey:kAssetsContentType];
}

- (id)copyWithZone:(NSZone *)zone
{
    Assets *copy = [[Assets alloc] init];
    
    if (copy) {

        copy.unzippedBaseUrl = [self.unzippedBaseUrl copyWithZone:zone];
        copy.info = [self.info copyWithZone:zone];
        copy.assetsIdentifier = [self.assetsIdentifier copyWithZone:zone];
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.copyright = [self.copyright copyWithZone:zone];
        copy.link = [self.link copyWithZone:zone];
        copy.meta = [self.meta copyWithZone:zone];
        copy.updatedAt = [self.updatedAt copyWithZone:zone];
        copy.path = [self.path copyWithZone:zone];
        copy.size = self.size;
        copy.contentType = [self.contentType copyWithZone:zone];
    }
    
    return copy;
}


@end
