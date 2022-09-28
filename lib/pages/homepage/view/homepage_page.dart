import 'package:awesome_app/pages/detail_page/view/detail_page.dart';
import 'package:awesome_app/pages/homepage/bloc/get_image_bloc/get_image_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const apiKey = '563492ad6f91700001000001dadbcc0ff5a84a6f9802312515f0de84';
    GetImageBloc imageBloc = GetImageBloc(repository: context.read<Repository>());
    return BlocProvider(
        create: (context) => imageBloc
          ..add(const GetImage(apiKey, 'curated?per_page=51')),
      child: HomePageView(imageBloc: imageBloc),
    );
  }
}


class HomePageView extends StatefulWidget {
  final GetImageBloc imageBloc;
  const HomePageView({Key? key, required this.imageBloc}) : super(key: key);

  @override
  State<HomePageView> createState() => _HomePageViewState(imageBloc);
}

class _HomePageViewState extends State<HomePageView> {
  GetImageBloc imageBloc;
  _HomePageViewState(this.imageBloc);
  final apiKey = '563492ad6f91700001000001dadbcc0ff5a84a6f9802312515f0de84';
  ScrollController _scrollController = ScrollController();
  List<ImageModel> list = List<ImageModel>.empty(growable: true);
  double initialOffset = 1000;
  int count = 1;
  bool loading = false;
  bool error = false;

  _onScroll() {
    if (_scrollController.offset>initialOffset) {
      setState(() {
        initialOffset += 1000;
        count++;
      });
      imageBloc.add(GetImage(apiKey, 'curated?page=$count&per_page=51'));
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _scrollController.addListener(() => _onScroll());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<GetImageBloc, GetImageState>(
        listener: (context, state){
          final status = state.status;
          if(status == GetImageStatus.success) {
            setState(() {
              list.addAll(state.items!);
              loading = false;
            });
          }
          if(status == GetImageStatus.loading) {
            setState(() {
                loading = true;
              });
          }
          if(status == GetImageStatus.failure){
            setState(() {
              loading = false;
              error = true;
            });
          }
        },
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            const SliverAppBar(
              title: Text('Awesome App'),
              floating: true,
              expandedHeight: 80,
            ),
            SliverGrid(
              delegate: SliverChildListDelegate(
                  [
                    ...list.map((e) => GestureDetector(
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(
                                builder: (_)=>DetailPage(image: e)
                            ),
                        ),
                        child: gridItem(e.src!.medium!))),
                    // SliverChildBuilderDelegate(
                    //       (context, index) => gridItem(),
                    //   childCount: state.items!.length,
                    // ),
                    SizedBox(),
                    Visibility(
                        visible: loading,
                        child: const Center(child: CircularProgressIndicator())),
                    SizedBox(),
                    SizedBox(),
                    Visibility(
                        visible: error,
                        child: Center(child: Text('An error occured, please refresh')))
                  ]
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 1
              ),
            ),
          ],
        )
      ),
    );
  }

  Widget gridItem(String url){
    return SizedBox(
        child: Image.network(url,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Center(
              child: Container(color: Colors.grey)
            );
          },
          errorBuilder: (BuildContext context, Object exception,
              StackTrace? stackTrace){
            return Center(
                child: Container(color: Colors.grey)
            );
          },
          fit: BoxFit.cover,
        )
    );
  }
}
