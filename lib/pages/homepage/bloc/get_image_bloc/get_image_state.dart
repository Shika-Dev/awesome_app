part of 'get_image_bloc.dart';

enum GetImageStatus { initial, loading, success, failure }

class GetImageState extends Equatable {
  const GetImageState.__({
    this.items,
    this.errorMessage,
    required this.status,
  });

  const GetImageState.initial() : this.__(status: GetImageStatus.initial);

  const GetImageState.loading() : this.__(status: GetImageStatus.loading);

  const GetImageState.success(
      List<ImageModel> items,
      ) : this.__(
    status: GetImageStatus.success,
    items: items,
  );
  const GetImageState.failure(
      String errorMessage,
      ) : this.__(
    status: GetImageStatus.failure,
    errorMessage: errorMessage,
  );

  final List<ImageModel>? items;
  final String? errorMessage;
  final GetImageStatus status;

  @override
  List<Object?> get props => [items, errorMessage, status];

}
