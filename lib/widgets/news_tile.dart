
import 'package:flutter/material.dart';
import 'package:news_app_ui_setup/models/article_model.dart';



class NewsTile extends StatelessWidget {
  const NewsTile({super.key, required this.articleModel,});
final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child:Image.network(
             articleModel.image??"https://us.123rf.com/450wm/mingirov/mingirov2011/mingirov201100696/158579599-gold-world-and-global-news-concept-icon-isolated-on-black-background-world-globe-symbol-news-sign.jpg?ver=6",
            height: 170,
            width:double.infinity ,
            fit: BoxFit.cover,
          )
        ),
          Text(
          articleModel.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.black87,fontWeight: FontWeight.w500,fontSize: 20),
        ),
        const SizedBox(height: 10,),
          Text(
          articleModel.subtitle??"",
          style: const TextStyle(color: Colors.grey,fontWeight: FontWeight.normal,fontSize: 18),
        ),
      ],
    );
  }
}
