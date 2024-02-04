class NewsQueryModel{
  late String newsHead;
  late String newsDes;
  late String newsImg;
  late String newsUrl;
  NewsQueryModel({this.newsHead = "NEWS HEADLINE", this.newsDes = "SOME URL", this.newsImg = "SOME IMG", this.newsUrl = "SOME URL"});
  factory NewsQueryModel.fromMap(Map news){
    return NewsQueryModel(
        newsHead: news["title"],
        newsDes: news["description"],
        newsImg: news["urlToImage"],
        newsUrl: news["url"]

    );
  }
}