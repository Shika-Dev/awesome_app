import 'package:bloc/bloc.dart';
import 'package:repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;

part 'get_image_event.dart';
part 'get_image_state.dart';

class GetImageBloc extends Bloc<ImageEvent, GetImageState> {
  final Repository _repository;

  GetImageBloc({
    required Repository repository,
  })  : _repository = repository,
        super(const GetImageState.initial()) {
    on<GetImage>((event, emit) => _getImage(emit, event));
  }

  Future<void> _getImage(
      Emitter<GetImageState> emit,
      GetImage event,
      ) async {
    emit(const GetImageState.loading());
    try {

      CuratedImageModel items = await _repository.apiRequest<CuratedImageModel, void>
        (event.path, client: http.Client(), apiKey: event.apiKey);
      emit(GetImageState.success(items.photos??[]));
    } catch (error) {
      emit(GetImageState.failure(error.toString()));
    }
  }
}
