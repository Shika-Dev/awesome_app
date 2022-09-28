import 'package:awesome_app/pages/homepage/view/homepage_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/repository.dart';

class App extends StatelessWidget {
  const App(
      {Key? key,
        required Repository repository})
      : _repository = repository,
        super(key: key);

  final Repository _repository;


  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: _repository),
      ],
      child: MaterialApp(
        title: 'Cafetaria',
        home:  HomePage(),
      ),
    );
  }
}
