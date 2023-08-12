import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/di/get_it.dart';
import 'package:news_app/presentation/blocs/headlines_news/headlines_news_bloc.dart';
import 'package:news_app/presentation/blocs/news/news_bloc.dart';
import 'package:news_app/presentation/screens/home/widgets/article_card.dart';
import 'package:news_app/presentation/screens/home/widgets/article_row_item.dart';
import 'package:news_app/presentation/screens/home/widgets/loading_article_card.dart';
import 'package:news_app/presentation/screens/home/widgets/loading_article_row_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late NewsBloc _newsBloc;
  late HeadlinesNewsBloc _headlinesNewsBloc;

  @override
  void initState() {
    super.initState();
    _newsBloc = getItInstance();
    _newsBloc.add(LoadNewsEvent());

    _headlinesNewsBloc = getItInstance();
    _headlinesNewsBloc.add(const LoadHeadlinesNewsEvent('technology'));
  }

  @override
  void dispose() {
    super.dispose();
    _newsBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: _newsBloc,
        ),
        BlocProvider.value(
          value: _headlinesNewsBloc,
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BuzzByte'),
          forceMaterialTransparency: true,
          centerTitle: true,
        ),
        body: _buildBody(context),
      ),
    );
  }

  // Widget _buildBody(NewsState state) {
  //   if (state is NewsLoading) {
  //     return const Center(
  //       child: CircularProgressIndicator.adaptive(),
  //     );
  //   } else if (state is NewsLoaded) {
  //     final articles = state.articles;
  //     return Padding(
  //       padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
  //       child: SingleChildScrollView(
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Text(
  //               'Headlines',
  //               style: Theme.of(context)
  //                   .textTheme
  //                   .headlineLarge!
  //                   .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
  //             ),
  //             SizedBox(
  //               height: 250.h,
  //               child: ListView.builder(
  //                 scrollDirection: Axis.horizontal,
  //                 shrinkWrap: true,
  //                 itemCount: articles.length,
  //                 itemBuilder: (context, index) {
  //                   var article = articles[index];
  //                   return ArticleCard(article: article);
  //                 },
  //               ),
  //             ),
  //             SizedBox(
  //               height: 16.h,
  //             ),
  //             Text(
  //               'Top News',
  //               style: Theme.of(context)
  //                   .textTheme
  //                   .headlineLarge!
  //                   .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
  //             ),
  //             ListView.builder(
  //               physics: const NeverScrollableScrollPhysics(),
  //               shrinkWrap: true,
  //               itemCount: articles.length,
  //               itemBuilder: (context, index) {
  //                 var article = articles[index];
  //                 return ArticleRowItem(article: article);
  //               },
  //             )
  //           ],
  //         ),
  //       ),
  //     );
  //   } else {
  //     return const SizedBox.shrink();
  //   }
  // }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Headlines',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            BlocBuilder<HeadlinesNewsBloc, HeadlinesNewsState>(
              builder: (context, state) {
                if (state is HeadlinesNewsLoading) {
                  return SizedBox(
                    height: 250.h,
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: const [
                        LoadingArticleCard(),
                        LoadingArticleCard(),
                        LoadingArticleCard(),
                      ],
                    ),
                  );
                } else if (state is HeadlinesNewsLoaded) {
                  var articles = state.articles;
                  return SizedBox(
                    height: 250.h,
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 8.h),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        var article = articles[index];
                        return ArticleCard(article: article);
                      },
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              'Top News',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                if (state is NewsLoading) {
                  print('Heeeee');
                  return ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: const [
                      LoadingArticleRowItem(),
                      LoadingArticleRowItem(),
                      LoadingArticleRowItem(),
                      LoadingArticleRowItem(),
                    ],
                  );
                } else if (state is NewsLoaded) {
                  var articles = state.articles;

                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      var article = articles[index];
                      return ArticleRowItem(article: article);
                    },
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
