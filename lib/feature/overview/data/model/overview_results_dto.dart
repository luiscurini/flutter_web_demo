import 'package:json_annotation/json_annotation.dart';

part 'overview_results_dto.g.dart';

@JsonSerializable()
class OverviewResultsDto {
  List<ResultsDto>? results;

  OverviewResultsDto({this.results});

  factory OverviewResultsDto.fromJson(Map<String, dynamic> json) =>
      _$OverviewResultsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OverviewResultsDtoToJson(this);
}

@JsonSerializable()
class ResultsDto {
  GeocodesDto? geocodes;
  LocationDto? location;
  String? name;
  List<PhotosDto>? photos;
  int? price;
  double? rating;
  List<TipsDto>? tips;

  ResultsDto(
      {this.geocodes,
      this.location,
      this.name,
      this.photos,
      this.price,
      this.rating,
      this.tips});

  factory ResultsDto.fromJson(Map<String, dynamic> json) =>
      _$ResultsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsDtoToJson(this);
}

@JsonSerializable()
class TipsDto {
  @JsonKey(name: 'created_at')
  String? createdAt;
  String? text;

  TipsDto({this.createdAt, this.text});

  factory TipsDto.fromJson(Map<String, dynamic> json) =>
      _$TipsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TipsDtoToJson(this);
}

@JsonSerializable()
class PhotosDto {
  String? id;

  @JsonKey(name: 'created_at')
  String? createdAt;
  String? prefix;
  String? suffix;
  num? width;
  num? height;

  PhotosDto(
      {this.id,
      this.createdAt,
      this.prefix,
      this.suffix,
      this.width,
      this.height});

  factory PhotosDto.fromJson(Map<String, dynamic> json) =>
      _$PhotosDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotosDtoToJson(this);
}

@JsonSerializable()
class LocationDto {
  String? address;
  String? country;
  @JsonKey(name: 'cross_street')
  String? crossStreet;
  @JsonKey(name: 'formatted_address')
  String? formattedAddress;
  String? locality;
  String? postcode;
  String? region;

  LocationDto(
      {this.address,
      this.country,
      this.crossStreet,
      this.formattedAddress,
      this.locality,
      this.postcode,
      this.region});

  factory LocationDto.fromJson(Map<String, dynamic> json) =>
      _$LocationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LocationDtoToJson(this);
}

@JsonSerializable()
class GeocodesDto {
  MainDto? main;

  GeocodesDto({this.main});

  factory GeocodesDto.fromJson(Map<String, dynamic> json) =>
      _$GeocodesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GeocodesDtoToJson(this);
}

@JsonSerializable()
class MainDto {
  double? latitude;
  double? longitude;

  MainDto({this.latitude, this.longitude});

  factory MainDto.fromJson(Map<String, dynamic> json) =>
      _$MainDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MainDtoToJson(this);
}
