import 'package:dio/dio.dart';
import 'package:news_app_ui_setup/models/article_model.dart';

class NewsService{
  final dio=Dio() ;

  //NewsService(this.dio);

  Future<List<ArticleModel>> getTopHeadLines({required String category})async{
    try{
      var response=await dio.get(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=bbe914eab3904b7b8e0d53fe46c6aa1a&category=$category",
    );
    Map <String,dynamic> jsonData=response.data;
    List<dynamic> articles=jsonData['articles'];
    List<ArticleModel> articlesList=[];
    for(var article in articles){
      ArticleModel articleModel=ArticleModel.fromJson(article);
      articlesList.add(articleModel);
    }
  return articlesList;
  }catch(e){
      return [];
    }
}
}