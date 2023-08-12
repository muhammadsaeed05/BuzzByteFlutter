import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/di/get_it.dart';
import 'package:news_app/domain/entities/article_entity.dart';
import 'package:news_app/presentation/blocs/bloc/news_bloc.dart';
import 'package:news_app/presentation/screens/home/widgets/article_card.dart';
import 'package:news_app/presentation/screens/home/widgets/article_row_item.dart';
import 'package:news_app/presentation/theme/theme_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late NewsBloc _newsBloc;

  @override
  void initState() {
    super.initState();
    _newsBloc = getItInstance();
    _newsBloc.add(LoadNewsEvent());
  }

  @override
  void dispose() {
    super.dispose();
    _newsBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      bloc: _newsBloc,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('NewsBuzz'),
            forceMaterialTransparency: true,
            centerTitle: true,
          ),
          body: _buildBody(state),
        );
      },
    );
  }

  Widget _buildBody(NewsState state) {
    if (state is NewsLoading) {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    } else if (state is NewsLoaded) {
      final articles = state.articles;
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
              SizedBox(
                height: 250.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    var article = articles[index];
                    return ArticleCard(article: article);
                  },
                ),
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
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  var article = articles[index];
                  return ArticleRowItem(article: article);
                },
              )
            ],
          ),
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
