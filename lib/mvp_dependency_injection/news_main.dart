import 'package:flutter/material.dart';
import 'package:test_flutter_online/mvp_dependency_injection/dependency/Injector.dart';
import 'package:test_flutter_online/mvp_dependency_injection/model/news.dart';
import 'package:test_flutter_online/mvp_dependency_injection/model/news_repo.dart';
import 'package:test_flutter_online/mvp_dependency_injection/presenter/news_presenter.dart';
import 'package:test_flutter_online/mvp_dependency_injection/view/news_view.dart';

class NewsMain extends StatelessWidget {
  const NewsMain({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: NewsHome(),
        appBar: AppBar(
          title: Text("News"),
        ),
      ),
    );
  }
}

class NewsHome extends StatefulWidget {
  @override
  _NewsHomeState createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> implements NewsView {
  List<News> news;
  String errorMsg;
  bool loading = true;
  final NewsRepository _repository = Injector().newsRepository;
  NewsPresenter _presenter;

  @override
  void initState() {
    _presenter =
        new NewsPresenter(newsView: this, newsRepository: this._repository);
    _presenter.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: loading
          ? Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[CircularProgressIndicator(), Text("Loading")],
            ))
          : RefreshIndicator(
              child: this.errorMsg == null
                  ? ListView.builder(
                      itemCount: news?.length == null ? 0 : news.length,
                      itemBuilder: (cxt, index) {
                        return Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  news[index].title?.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Image.network(
                                news[index].urlToImage,
                                fit: BoxFit.fill,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(news[index].description),
                              )
                            ],
                          ),
                        );
                      })
                  : ListView(
                      children: <Widget>[
                        Text(this.errorMsg.toString()),
                      ],
                    ),
              onRefresh: () async {
                _presenter.loadData();
                await Future.delayed(Duration(seconds: 2));
              }),
    );
  }

  @override
  fetchError(FetchError fetchError) {
    setState(() {
      this.errorMsg = fetchError.toString();
      this.loading = false;
    });
  }

  @override
  fetchedNews(List<News> news) {
    setState(() {
      this.errorMsg = null;
      this.news = news;
      this.loading = false;
    });
  }
}
