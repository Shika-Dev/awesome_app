
import 'package:awesome_app/pages/detail_page/view/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:repository/repository.dart';


void main() {
  testWidgets('Test initialize detail page', (WidgetTester tester) async {
    await mockNetworkImages(() async {
      await tester.pumpWidget(const MaterialApp(
        home: DetailPage(
            image: ImageModel(
                id: 1,
                width: 800,
                height: 800,
                url: 'www.mock_url.com',
                photographer: 'Rama',
                photographer_id: 210211,
                avg_color: '#ee3124',
                alt: 'A dummy picture',
                src: ImageSource(
                    original: 'www.image-original.com',
                    landscape: 'www.image-landscape.com',
                    portrait: 'www.image-portrait.com',
                    small: 'www.image-small.com',
                    medium: 'www.image-medium.com',
                    large2x: 'www.image-large2x.com',
                    large: 'www.image-large.com'
                )
            )),
      ));

      expect(find.text('Rama'), findsOneWidget);
      expect(find.text('(210211)'), findsOneWidget);
    });
  });

  testWidgets('Test tap visit page', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: DetailPage(
          image: ImageModel(
              id: 1,
              width: 800,
              height: 800,
              url: 'www.mock_url.com',
              photographer: 'Rama',
              photographer_id: 210211,
              avg_color: '#ee3124',
              alt: 'A dummy picture',
              src: ImageSource(
                  original: 'www.image-original.com',
                  landscape: 'www.image-landscape.com',
                  portrait: 'www.image-portrait.com',
                  small: 'www.image-small.com',
                  medium: 'www.image-medium.com',
                  large2x: 'www.image-large2x.com',
                  large: 'www.image-large.com'
              )
          )),
    ));

    await tester.tap(find.text('Visit the Page'));
    await tester.pumpAndSettle();

    if(await canLaunch('www.mock_url.com')){
      expect(launchUrl(Uri.parse('www.mock_url.com'), mode: LaunchMode.platformDefault), findsOneWidget);
    } else expect( await canLaunch("www.mock_url.com"), throwsException);
  });
}
