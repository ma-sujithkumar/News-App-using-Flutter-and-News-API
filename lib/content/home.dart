import 'package:flutter/material.dart';
import 'package:stories_app/article_structure/article_structure.dart';
import 'package:stories_app/content/article.dart';
import 'package:stories_app/fetchNews.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home> {
  @override
  List<ArticleStructure> articles=new List<ArticleStructure>();
  bool _loading=true;

  void getNews1() async {
    News newsObj = News();
    await newsObj.getNews();
    articles = newsObj.news;
    setState(() {
      _loading = false;
    });
  }

  Widget build(BuildContext context) {
    getNews1();
    return Scaffold(
      appBar:AppBar(
            title:Text(
                "Tech News",
              style:TextStyle(
                color:Colors.blueAccent
              )
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
        ),
          body:_loading? Center(
            child: Container(
              child:CircularProgressIndicator(),
            ),
          ):Container(
          padding: EdgeInsets.all(16.0),
          child: ListView.builder(
            //shrinkWrap: true,
            physics:ClampingScrollPhysics(),
            itemCount: articles.length,
              itemBuilder:(context,index) {
              return NewsTile(
                imageUrl: articles[index].urlToImage,
                title: articles[index].title,
                description: articles[index].description,
                url:articles[index].url,
              );
              }),


            )
        );


  }
}


class NewsTile extends StatelessWidget {
  final String imageUrl,title,description,url;
  NewsTile({@required this.imageUrl, @required this.title, @required this.description, @required this.url});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ArticleViewer(
            Url:url

          )
        ));
      },
      child: Container(
        child:Column(
          children:<Widget> [
            ClipRRect(
              borderRadius:BorderRadius.circular(5),
                child: CachedNetworkImage(imageUrl:imageUrl)),
            SizedBox(height: 8,),
            Text(
                title,
              style:TextStyle(
                fontSize:18,
                color:Colors.black87,
                fontWeight: FontWeight.w600,
              )
            ),
            SizedBox(height: 8,),
            Text(description),
            SizedBox(height: 20,)
          ],
        )
      ),
    );
  }
}
