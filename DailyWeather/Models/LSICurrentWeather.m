//
//  LSICurrentWeather.m
//  DailyWeather
//
//  Created by Mark Gerrior on 5/14/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "LSICurrentWeather.h"

@implementation LSICurrentWeather

- (instancetype)initWithTime:(NSDate *)time
                     summary:(NSString *)summary
                        icon:(NSString *)icon
           precipProbability:(NSNumber *)precipProbability
             precipIntensity:(NSNumber *)precipIntensity
                 temperature:(double)temperature
         apparentTemperature:(double)apparentTemperature
                    humidity:(NSNumber *)humidity
                    pressure:(NSNumber *)pressure
                   windSpeed:(NSNumber *)windSpeed
                 windBearing:(NSNumber *)windBearing
                     uvIndex:(NSNumber *)uvIndex {

    self = [super init];
    if (self != nil) {
        _time = time;
        _summary = [summary copy];
        _icon = [icon copy];
        _precipProbability = precipProbability;
        _precipIntensity = precipIntensity;
        _temperature = temperature;
        _apparentTemperature = apparentTemperature;
        _humidity = humidity;
        _pressure = pressure;
        _windSpeed = windSpeed;
        _windBearing = windBearing;
        _uvIndex = uvIndex;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {

    NSNumber *timeAsNumber        = dictionary[@"time"];
    NSString *summary             = dictionary[@"summary"];
    NSString *icon                = dictionary[@"icon"];
    NSNumber *precipProbability   = dictionary[@"precipProbability"];
    NSNumber *precipIntensity     = dictionary[@"precipIntensity"];
    NSNumber *temperature         = dictionary[@"temperature"];
    NSNumber *apparentTemperature = dictionary[@"apparentTemperature"];
    NSNumber *humidity            = dictionary[@"humidity"];
    NSNumber *pressure            = dictionary[@"pressure"];
    NSNumber *windSpeed           = dictionary[@"windSpeed"];
    NSNumber *windBearing         = dictionary[@"windBearing"];
    NSNumber *uvIndex             = dictionary[@"uvIndex"];

    // a UNIX time (that is, seconds since midnight GMT on 1 Jan 1970)
    // FIXME: or a string formatted as follows: [YYYY]-[MM]-[DD]T[HH]:[MM]:[SS][timezone]. timezone
    double timeInSeconds = timeAsNumber.doubleValue;
    NSDate *time = [NSDate dateWithTimeIntervalSince1970:timeInSeconds];

    if ([precipProbability   isKindOfClass:[NSNull class]]) { precipProbability   = nil; }
    if ([precipIntensity     isKindOfClass:[NSNull class]]) { precipIntensity     = nil; }
    if ([temperature         isKindOfClass:[NSNull class]]) { temperature         = nil; }
    if ([apparentTemperature isKindOfClass:[NSNull class]]) { apparentTemperature = nil; }
    if ([humidity            isKindOfClass:[NSNull class]]) { humidity            = nil; }
    if ([pressure            isKindOfClass:[NSNull class]]) { pressure            = nil; }
    if ([windSpeed           isKindOfClass:[NSNull class]]) { windSpeed           = nil; }
    if ([windBearing         isKindOfClass:[NSNull class]]) { windBearing         = nil; }
    if ([uvIndex             isKindOfClass:[NSNull class]]) { uvIndex             = nil; }

    // The required elements
    if (!time || !temperature || !apparentTemperature) {
        return nil;
    }

    return [self initWithTime:time
                      summary:summary
                         icon:icon
            precipProbability:precipProbability
              precipIntensity:precipIntensity
                  temperature:temperature.doubleValue
          apparentTemperature:apparentTemperature.doubleValue
                     humidity:humidity
                     pressure:pressure
                    windSpeed:windSpeed
                  windBearing:windBearing
                      uvIndex:uvIndex
            ];
}

@end
