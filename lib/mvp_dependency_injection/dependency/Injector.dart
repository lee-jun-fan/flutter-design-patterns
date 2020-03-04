import 'package:test_flutter_online/mvp_dependency_injection/model/news_repo.dart';

enum Flavor { MOCK, PROD }

class Injector {
  static final Injector _injector = Injector._internal();
  static Flavor flavor;

  factory Injector() {
    return _injector;
  }
  Injector._internal();

  Injector.config(Flavor fla) {
    flavor = fla;
  }

  NewsRepository get newsRepository {
    switch (flavor) {
      case Flavor.MOCK:
        return MockNewsRepository();
        break;
      default:
        return ProdNewsRepository();
        break;
    }
  }
}
