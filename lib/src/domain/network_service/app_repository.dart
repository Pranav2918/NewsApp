import 'package:cubitdemo/src/config/const/api_const.dart';
import 'package:cubitdemo/src/data/news_model.dart';
import 'package:cubitdemo/src/domain/network_service/dio_helper.dart';

class AppRepository {
  static final DioHelper _dioHelper = DioHelper();

  Future<News> fetchNews() async {
    var response = await _dioHelper.get(
        url:
            "https://newsapi.org/v2/top-headlines?country=in&apiKey=${APIConst.apiKey}",
        isAuthRequired: false);
    return News.fromJson(
        response); //Change according to your response (For model = i.e. Model.fromJson(response), and give returnType to your model instead of dynamic)
  }
}
