import 'package:test_flutter_online/mvp_dependency_injection/model/news.dart';
import 'package:test_flutter_online/mvp_dependency_injection/model/news_repo.dart';

abstract class NewsView {
  void fetchedNews(List<News> news);
  void fetchError(FetchError fetchError);
}
