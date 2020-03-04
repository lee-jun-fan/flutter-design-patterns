import 'dart:convert';

import 'package:test_flutter_online/mvp_dependency_injection/model/news.dart';
import 'package:http/http.dart' as http;

abstract class NewsRepository {
  Future<List<News>> fetchNews();
}

class ProdNewsRepository extends NewsRepository {
  @override
  Future<List<News>> fetchNews() async {
    final res = await http.get("http://newsapi.org/v2/top-headlines?country=us&apiKey=609d41cac9f54ffaa19d0589b2fbfef5");
    if (res.statusCode != 200 && res.body != null) {
      throw new FetchError("Status code ${res.statusCode}");
    }
    final newData = json.decode(res.body)['articles'] as List;
    return newData.map((f) => News.fromJson(f)).toList();
  }
}

class MockNewsRepository implements NewsRepository {
  @override
  Future<List<News>> fetchNews() {
    return Future.value(news);
  }

  final news = <News>[
    News(
        title: "News' title 1",
        description: "Description 1",
        urlToImage: "https://i.ytimg.com/vi/qhbF70hzzcw/hqdefault.jpg"),
    // News(
    //     title: "News' title 1",
    //     description: "Description 1",
    //     urlToImage: "https://i.ytimg.com/vi/qhbF70hzzcw/hqdefault.jpg"),
    // News(
    //     title: "News' title 1",
    //     description: "Description 1",
    //     urlToImage: "https://i.ytimg.com/vi/qhbF70hzzcw/hqdefault.jpg"),
    // News(
    //     title: "News' title 1",
    //     description: "Description 1",
    //     urlToImage: "https://i.ytimg.com/vi/qhbF70hzzcw/hqdefault.jpg")
  ];
}

class FetchError implements Exception {
  final message;
  FetchError([this.message]);

  @override
  String toString() {
    if (message == null) return "Exception";
    return "Fetch Error: [$message]";
  }
}
