import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:repository/src/models/image_model.dart';

class Repository{
  Future<T> apiRequest<T, K>(String path,
      {required String apiKey, required http.Client client,
        Map? body}) async {

    String _baseUrl = 'https://api.pexels.com/v1/';
    Map<String, String> Header = {'Authorization': apiKey};

    final response =
    await client.get(Uri.parse(_baseUrl + path), headers: Header);
    T model = Generic.fromJson(json.decode(response.body));
    if(response.statusCode!=200)
      throw Exception('Error occurred');
    else return model;
  }
}

class Generic {
  /// If T is a List, K is the subtype of the list.
  static T fromJson<T, K>(dynamic json) {
    if (json is Iterable) {
      return _fromJsonList<K>(json) as T;
    } else if (T == CuratedImageModel) {
      return CuratedImageModel.fromJson(json) as T;
    } else if (T == bool || T == String || T == int || T == double) {
      // primitives
      return json;
    } else {
      throw Exception("Unknown class");
    }
  }

  static List<K>? _fromJsonList<K>(Iterable<dynamic> jsonList) {
    return jsonList.map<K>((dynamic json) => fromJson<K, void>(json)).toList();
  }
}
