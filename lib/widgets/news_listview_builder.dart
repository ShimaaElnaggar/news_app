
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';
import 'package:news_app_ui_setup/services/news_service.dart';
import 'package:news_app_ui_setup/widgets/news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({
    required this.category,
    super.key,
  });
final String category;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var future;
  @override
  void initState() {
    super.initState();
   future= NewsService().getTopHeadLines(
     category: widget.category,
   );
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
        future:  future,
        builder: (context,snapshot){
          if(snapshot.hasData){
          return  NewsListView(articles: snapshot.data!,);
          }else if(snapshot.hasError){
            return const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Text("oops! There was an error, try later"),
              ),
            );
          }else{
            return const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child:CircularProgressIndicator(),
              ),
            );
          }
        }
    );
  }
}