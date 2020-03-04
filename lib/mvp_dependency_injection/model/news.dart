class News {
  final String title, description, urlToImage;

  News({this.title, this.description, this.urlToImage});

  News.fromJson(Map<String, dynamic> json)
      : this.title = json['title'] as String,
        this.description = json['description'] as String,
        this.urlToImage = json['urlToImage'] as String;
}
