import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class CuratedImageModel extends Equatable{
  const CuratedImageModel({
    this.photos,
    this.page,
    this.per_page
  });

  final int? page;
  final int? per_page;
  final List<ImageModel>? photos;

  factory CuratedImageModel.fromJson(Map<String, dynamic> json) =>
      _$CuratedImageModelFromJson(json);

  @override
  List<Object?> get props => [
    page,
    per_page,
    photos,
  ];
}

@JsonSerializable()
class ImageModel extends Equatable {
  const ImageModel({
    this.id,
    this.width,
    this.height,
    this.url,
    this.photographer,
    this.photographer_id,
    this.avg_color,
    this.alt,
    this.src,
  });
  final int? id;
  final int? width;
  final int? height;
  final String? url;
  final int? photographer_id;
  final String? photographer;
  final String? avg_color;
  final String? alt;
  final ImageSource? src;

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  @override
  List<Object?> get props => [
    id,
    width,
    height,
    url,
    photographer_id,
    photographer,
    avg_color,
    alt,
    src,
  ];

}

@JsonSerializable()
class ImageSource extends Equatable {
  const ImageSource({
    this.original,
    this.large,
    this.large2x,
    this.medium,
    this.small,
    this.portrait,
    this.landscape,
    this.tiny,
  });
  final String? original;
  final String? large2x;
  final String? large;
  final String? medium;
  final String? small;
  final String? portrait;
  final String? landscape;
  final String? tiny;

  factory ImageSource.fromJson(Map<String, dynamic> json) =>
      _$ImageSourceFromJson(json);

  @override
  List<Object?> get props => [original, landscape, large, large2x, medium, small, portrait, tiny];

}