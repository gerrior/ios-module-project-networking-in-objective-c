//
//  LSIHourlyForecast.h
//  DailyWeather
//
//  Created by Mark Gerrior on 5/13/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSIHourlyForecast : NSObject

// Everything is optional unless noted.
@property (nonatomic, readonly) NSDate *time; // unix time, required.
@property (nonatomic, readonly, nullable, copy) NSString *summary;
@property (nonatomic, readonly, nullable, copy) NSString *icon;
@property (nonatomic, readonly, nullable) NSNumber *precipProbability;
@property (nonatomic, readonly, nullable, copy) NSString *precipType; // "rain", "snow", "sleet", or nil
@property (nonatomic, readonly, nullable) NSNumber *temperature;
@property (nonatomic, readonly, nullable) NSNumber *apparentTemperature; // Feels like
@property (nonatomic, readonly, nullable) NSNumber *humidity;
@property (nonatomic, readonly, nullable) NSNumber *pressure;
@property (nonatomic, readonly, nullable) NSNumber *windSpeed;
@property (nonatomic, readonly, nullable) NSNumber *windBearing;
@property (nonatomic, readonly, nullable) NSNumber *uvIndex;

- (instancetype)initWithTime:(NSDate *)time
                     summary:(NSString *)summary
                        icon:(NSString *)icon
           precipProbability:(NSNumber *)precipProbability
                  precipType:(NSString *)precipType
                 temperature:(NSNumber *)temperature
         apparentTemperature:(NSNumber *)apparentTemperature
                    humidity:(NSNumber *)humidity
                    pressure:(NSNumber *)pressure
                   windSpeed:(NSNumber *)windSpeed
                 windBearing:(NSNumber *)windBearing
                     uvIndex:(NSNumber *)uvIndex;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
