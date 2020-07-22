import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:stories_app/article_structure/article_structure.dart';
import 'package:http/http.dart';

class News{
  List<ArticleStructure> news =[];
  Future<Widget> getNews() async{
    var response = await get("http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=68cb74b3d67848588beba860974066f6");
    var jsonData = jsonDecode(response.body);
    if(jsonData["status"]=="ok")
      {
        jsonData["articles"].forEach((article) {
              if (article["urlToImage"] !=null && article["description"] !=null)
                {
                  ArticleStructure articleStructure = ArticleStructure(
                    title: article["title"],
                    content: article["content"],
                    urlToImage: article["urlToImage"],
                    description: article["description"],
                    url: article["url"],
                  );

                  news.add(articleStructure);
                }
            });
      }
  }
}
