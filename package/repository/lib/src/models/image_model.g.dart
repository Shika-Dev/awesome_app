// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CuratedImageModel _$CuratedImageModelFromJson(Map<String, dynamic> json) =>
    CuratedImageModel(
      photos: (json['photos'] as List<dynamic>?)
          ?.map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: json['page'] as int?,
      per_page: json['per_page'] as int?,
    );

Map<String, dynamic> _$CuratedImageModelToJson(CuratedImageModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.per_page,
      'photos': instance.photos,
    };

ImageModel _$ImageModelFromJson(Map<String, dynamic> json) => ImageModel(
      id: json['id'] as int?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      url: json['url'] as String?,
      photographer: json['photographer'] as String?,
      photographer_id: json['photographer_id'] as int?,
      avg_color: json['avg_color'] as String?,
      alt: json['alt'] as String?,
      src: json['src'] == null
          ? null
          : ImageSource.fromJson(json['src'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImageModelToJson(ImageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
      'photographer_id': instance.photographer_id,
      'photographer': instance.photographer,
      'avg_color': instance.avg_color,
      'alt': instance.alt,
      'src': instance.src,
    };

ImageSource _$ImageSourceFromJson(Map<String, dynamic> json) => ImageSource(
      original: json['original'] as String?,
      large: json['large'] as String?,
      large2x: json['large2x'] as String?,
      medium: json['medium'] as String?,
      small: json['small'] as String?,
      portrait: json['portrait'] as String?,
      landscape: json['landscape'] as String?,
      tiny: json['tiny'] as String?,
    );

Map<String, dynamic> _$ImageSourceToJson(ImageSource instance) =>
    <String, dynamic>{
      'original': instance.original,
      'large2x': instance.large2x,
      'large': instance.large,
      'medium': instance.medium,
      'small': instance.small,
      'portrait': instance.portrait,
      'landscape': instance.landscape,
      'tiny': instance.tiny,
    };
