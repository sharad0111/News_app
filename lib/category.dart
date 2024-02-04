import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:news_app/model.dart';
class Category extends StatefulWidget {

  String Query;
  Category({required this.Query});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<NewsQueryModel> newsModelList = <NewsQueryModel>[];
  bool isLoading= true;
  getNewsByQuery(String query) async {
    String url ="";
    if(query == "Top News"|| query=="India") {
      url = "https://newsapi.org/v2/top-headlines?country=in&category=politics&apiKey=d1975f5992734cb3a4c8455bdefea8a5";
    }else if(query == "Technology"){
      url = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=d1975f5992734cb3a4c8455bdefea8a5";

    }
    else if(query =="Health"){
      url = "https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=d1975f5992734cb3a4c8455bdefea8a5";
    }
    else if(query=="Sports"){
    url ="https://newsapi.org/v2/top-headlines?country=in&category=sports&apiKey=d1975f5992734cb3a4c8455bdefea8a5";
    }
    else if(query=="ram mandir"||query=="ram"||query=="ayodhya"||query=="hindu"){
      url ="https://newsapi.org/v2/everything?q=mandir&from=2024-02-03&to=2024-02-03&sortBy=popularity&apiKey=d1975f5992734cb3a4c8455bdefea8a5";
    }
    else if(query=="food"){
      url ="https://newsapi.org/v2/everything?q=food&from=2024-02-03&to=2024-02-03&sortBy=popularity&apiKey=d1975f5992734cb3a4c8455bdefea8a5";
    }
    else if(query=="hospital"){
      url ="https://newsapi.org/v2/everything?q=hospital&from=2024-02-03&to=2024-02-03&sortBy=popularity&apiKey=d1975f5992734cb3a4c8455bdefea8a5";
    }
    else if(query=="indian festival"){
      url ="https://newsapi.org/v2/everything?q=indian%20festival&from=2024-02-03&to=2024-02-03&sortBy=popularity&apiKey=d1975f5992734cb3a4c8455bdefea8a5";
    }
    else if(query=="narendra modi"||query=="modi"){
      url ="https://newsapi.org/v2/everything?q=modi&from=2024-02-03&to=2024-02-03&sortBy=popularity&apiKey=d1975f5992734cb3a4c8455bdefea8a5";
    }
    else if(query=="bjp"){
      url ="https://newsapi.org/v2/everything?q=bjp&from=2024-02-03&to=2024-02-03&sortBy=popularity&apiKey=d1975f5992734cb3a4c8455bdefea8a5";
    }
    else if(query=="corona"||query=="covid-19"||query=="covid"){
      url ="https://newsapi.org/v2/everything?q=covid&from=2024-02-03&to=2024-02-03&sortBy=popularity&apiKey=d1975f5992734cb3a4c8455bdefea8a5";
    }
    else if(query=="jobs"){
      url ="https://newsapi.org/v2/everything?q=jobs&from=2024-02-03&to=2024-02-03&sortBy=popularity&apiKey=d1975f5992734cb3a4c8455bdefea8a5";
    }
    else if(query=="farmers"){
      url ="https://newsapi.org/v2/everything?q=farmers&from=2024-02-03&to=2024-02-03&sortBy=popularity&apiKey=d1975f5992734cb3a4c8455bdefea8a5";
    }
    else if(query=="army"||query=="iran"||query=="war"){
      url ="https://newsapi.org/v2/everything?q=army&from=2024-02-03&to=2024-02-03&sortBy=popularity&apiKey=d1975f5992734cb3a4c8455bdefea8a5";
    }
    else if(query=="bollywood"){
      url ="https://newsapi.org/v2/everything?q=bollywood&from=2024-02-03&to=2024-02-03&sortBy=popularity&apiKey=d1975f5992734cb3a4c8455bdefea8a5";
    }
    // else if(query==""){
    //   url ="";
    // }
    // else if(query==""){
    //   url ="";
    // }
    // else if(query==""){
    //   url ="";
    // }
    else {
      url =
      "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=d1975f5992734cb3a4c8455bdefea8a5";
    }
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    setState(() {
      data["articles"].forEach((element) {
        NewsQueryModel newsQueryModel = new NewsQueryModel();
        newsQueryModel = NewsQueryModel.fromMap(element);
        newsModelList.add(newsQueryModel);
        setState(() {
          isLoading = false;
        });

      });
    });

  }
  @override
  void initState(){
    super.initState();
    getNewsByQuery(widget.Query);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sharad's News"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              margin : EdgeInsets.fromLTRB(15, 25, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
SizedBox(width:12,),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  child: Text(widget.Query , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 39
                  ),),
                ),
                ],
              ),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: newsModelList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        elevation: 1.0,
                        child: Stack(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(newsModelList[index].newsImg ,fit: BoxFit.fitHeight, height: 230,width: double.infinity, )),

                            Positioned(
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: Container(

                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        gradient: LinearGradient(
                                            colors: [
                                              Colors.black12.withOpacity(0),
                                              Colors.black
                                            ],
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter
                                        )
                                    ),
                                    padding: EdgeInsets.fromLTRB(15, 15, 10, 8),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          newsModelList[index].newsHead,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(newsModelList[index].newsDes.length > 50 ? "${newsModelList[index].newsDes.substring(0,55)}...." : newsModelList[index].newsDes , style: TextStyle(color: Colors.white , fontSize: 12)
                                          ,)
                                      ],
                                    )))
                          ],
                        )),
                  );
                }),
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text("SHOW MORE")),
                ],
              ),
            )
          ],
        ),
      ),
    ),
    );
  }
}
