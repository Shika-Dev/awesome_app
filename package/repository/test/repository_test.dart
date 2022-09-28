import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:repository/repository.dart';

import 'package:mockito/annotations.dart';

import 'repository_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('repository', () {
    test('can be instantiated', () async {
      expect(Repository(), isNotNull);
    });

    test('test api request success', () async{
      final client = MockClient();
      final repository = Repository();

      when(client
          .get(Uri.parse('https://api.pexels.com/v1/curated'), headers: {'Authorization': 'apiKey'}))
          .thenAnswer((_) async =>
          http.Response('{"page": 1, "per_page": 1, "photos": [{"id": 1, "width": 2, "height": 2, "url": "http://www.dummy.com", "photographer": "Rama", "photographer_id":123456, "avg_color": "#ee3124", "src": {"original": "www.dummy.com", "tiny": "www.dummy.com", "small": "www.dummy.com", "medium": "www.dummy.com", "large": "www.dummy.com", "large2x": "www.dummy.com", "landscape": "www.dummy.com", "partrait": "www.dummy.com"}, "liked": false, "alt": "alt"}], "ext_page": "www.dummy.com"}', 200));
      expect(await repository.apiRequest<CuratedImageModel, void>('curated', client: client, apiKey: 'apiKey'), isA<CuratedImageModel>());
    });

    test('test api request failed', () async{
      final client = MockClient();
      final repository = Repository();

      when(client
          .get(Uri.parse('https://api.pexels.com/v1/curated'), headers: {'Authorization': 'apiKey'}))
          .thenAnswer((_) async =>
      http.Response('{"success": false, "message":"Not Found"}', 404));
      expect(repository.apiRequest<CuratedImageModel, void>('curated', client: client, apiKey: 'apiKey'), throwsException);
    });
  });
}
