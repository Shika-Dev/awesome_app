import 'package:awesome_app/app/view/app.dart';
import 'package:awesome_app/bootstrap.dart';
import 'package:repository/repository.dart';

void main() async {
  bootstrap(()async{
    final _repository = Repository();
    return App(
      repository: _repository,
    );
  });
}

