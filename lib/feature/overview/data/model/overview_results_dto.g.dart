// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'overview_results_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OverviewResultsDto _$OverviewResultsDtoFromJson(Map<String, dynamic> json) =>
    OverviewResultsDto(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => ResultsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OverviewResultsDtoToJson(OverviewResultsDto instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

ResultsDto _$ResultsDtoFromJson(Map<String, dynamic> json) => ResultsDto(
      geocodes: json['geocodes'] == null
          ? null
          : GeocodesDto.fromJson(json['geocodes'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : LocationDto.fromJson(json['location'] as Map<String, dynamic>),
      name: json['name'] as String?,
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => PhotosDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      price: (json['price'] as num?)?.toInt(),
      rating: (json['rating'] as num?)?.toDouble(),
      tips: (json['tips'] as List<dynamic>?)
          ?.map((e) => TipsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultsDtoToJson(ResultsDto instance) =>
    <String, dynamic>{
      'geocodes': instance.geocodes,
      'location': instance.location,
      'name': instance.name,
      'photos': instance.photos,
      'price': instance.price,
      'rating': instance.rating,
      'tips': instance.tips,
    };

TipsDto _$TipsDtoFromJson(Map<String, dynamic> json) => TipsDto(
      createdAt: json['created_at'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$TipsDtoToJson(TipsDto instance) => <String, dynamic>{
      'created_at': instance.createdAt,
      'text': instance.text,
    };

PhotosDto _$PhotosDtoFromJson(Map<String, dynamic> json) => PhotosDto(
      id: json['id'] as String?,
      createdAt: json['created_at'] as String?,
      prefix: json['prefix'] as String?,
      suffix: json['suffix'] as String?,
      width: json['width'] as num?,
      height: json['height'] as num?,
    );

Map<String, dynamic> _$PhotosDtoToJson(PhotosDto instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'prefix': instance.prefix,
      'suffix': instance.suffix,
      'width': instance.width,
      'height': instance.height,
    };

LocationDto _$LocationDtoFromJson(Map<String, dynamic> json) => LocationDto(
      address: json['address'] as String?,
      country: json['country'] as String?,
      crossStreet: json['cross_street'] as String?,
      formattedAddress: json['formatted_address'] as String?,
      locality: json['locality'] as String?,
      postcode: json['postcode'] as String?,
      region: json['region'] as String?,
    );

Map<String, dynamic> _$LocationDtoToJson(LocationDto instance) =>
    <String, dynamic>{
      'address': instance.address,
      'country': instance.country,
      'cross_street': instance.crossStreet,
      'formatted_address': instance.formattedAddress,
      'locality': instance.locality,
      'postcode': instance.postcode,
      'region': instance.region,
    };

GeocodesDto _$GeocodesDtoFromJson(Map<String, dynamic> json) => GeocodesDto(
      main: json['main'] == null
          ? null
          : MainDto.fromJson(json['main'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeocodesDtoToJson(GeocodesDto instance) =>
    <String, dynamic>{
      'main': instance.main,
    };

MainDto _$MainDtoFromJson(Map<String, dynamic> json) => MainDto(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MainDtoToJson(MainDto instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
