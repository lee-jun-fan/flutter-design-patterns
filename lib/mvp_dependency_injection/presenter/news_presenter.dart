import 'package:test_flutter_online/mvp_dependency_injection/model/news_repo.dart';
import 'package:test_flutter_online/mvp_dependency_injection/view/news_view.dart';

class NewsPresenter {
  final NewsView newsView;
  final NewsRepository newsRepository;

  NewsPresenter({this.newsView, this.newsRepository});

  void loadData() {
    this
        .newsRepository
        .fetchNews()
        .then((res) => this.newsView.fetchedNews(res))
        .catchError((e) => this.newsView.fetchError(e));
  }
}
