import 'package:flutter/material.dart';
import 'package:repository/repository.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final ImageModel image;
  const DetailPage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text('Awesome App', style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0,4),
                  blurRadius: 12,
                  color: Colors.black.withOpacity(.08)
                )
              ]
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(8),
                        topLeft: Radius.circular(8)
                    ),
                    image: DecorationImage(
                      image: NetworkImage(image.src!.large!),
                      fit: BoxFit.cover
                    ),
                  ),
                  width: double.infinity,
                  height: 400,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${image.photographer!}',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text('(${image.photographer_id})', style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16, color: Colors.black
                          ),)
                        ],
                      ),
                      GestureDetector(
                        onTap: () async {
                          String url = image.url!;
                          if (await canLaunch(url)) {
                            await launchUrl(Uri.parse(url),
                              mode: LaunchMode.platformDefault,
                            );
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                          child: Text('Visit the Page',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).primaryColor
                              )))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
