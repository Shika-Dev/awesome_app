part of 'get_image_bloc.dart';

abstract class ImageEvent extends Equatable {
  const ImageEvent();

  @override
  List<Object> get props => [];
}

class GetImage extends ImageEvent {
  final String apiKey;
  final String path;
  const GetImage(this.apiKey, this.path);

  @override
  List<Object> get props => [apiKey];
}
