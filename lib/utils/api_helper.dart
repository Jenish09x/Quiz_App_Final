import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:main_exam/screen/home/model/home_model.dart';
import 'package:main_exam/screen/quiz/model/quiz_model.dart';

class ApiHelper {
  static ApiHelper apiHelper = ApiHelper._();

  ApiHelper._();

  Future<List<HomeModel>?> getCategory() async {
    String apiLink =
        'http://192.168.2.114/FLUTTER_API/learning/read_category_Api.php';
    var res = await http.get(Uri.parse(apiLink));
    if (res.statusCode == 200) {
      List json = jsonDecode(res.body);
      List<HomeModel> h1 = json.map((e) => HomeModel.mapToModel(e)).toList();
      return h1;
    }
    return null;
  }

  Future<List<QuizModel>?> getQuiz() async {
    String apiLink =
        'http://192.168.2.114/FLUTTER_API/learning/read_quiz_Api.php';
    var res = await http.get(Uri.parse(apiLink));
    if (res.statusCode == 200) {
      List json = jsonDecode(res.body);
      List<QuizModel> q1 = json.map((e) => QuizModel.mapToModel(e)).toList();
      return q1;
    }
    return null;
  }

  Future<void> registerData() async {
    String apiLink = '';
    var res = await http.get(Uri.parse(apiLink));

    if (res.statusCode == 200) {
      List json = jsonDecode(res.body);
    }
  }
}
