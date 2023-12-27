
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/category_model.dart';
import 'package:news_app_ui_setup/widgets/categories_list_view.dart';
import 'package:news_app_ui_setup/widgets/news_listview_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, });
final List<CategoryModel> categories=const[
  CategoryModel(categoryName: "Business", image: "assets/business.jpg"),
  CategoryModel(categoryName: "Technology", image: "assets/technology.jpeg"),
  CategoryModel(categoryName: "Health", image: "assets/health.jpg"),
  CategoryModel(categoryName: "Science", image: "assets/science.avif"),
  CategoryModel(categoryName: "Sports", image: "assets/sports.jpg"),
  CategoryModel(categoryName: "Entertainment", image: "assets/entertainment.jpg"),
  CategoryModel(categoryName: "General", image: "assets/general.png"),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("News",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
            Text("Cloud",style: TextStyle(color: Colors.orange,fontSize: 25,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: CategoriesListView(categories: categories,)),
            const SliverToBoxAdapter(child: SizedBox(height: 32,)),
             const NewsListViewBuilder( category: 'general',),
          ],
        ),
      ),

    );
  }
}








