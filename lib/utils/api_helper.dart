import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:main_exam/screen/home/model/home_model.dart';
import 'package:main_exam/screen/quiz/model/quiz_model.dart';

class ApiHelper {
  static ApiHelper apiHelper = ApiHelper._();

  ApiHelper._();

  Future<List<HomeModel>?> getCategory() async {
    String apiLink =
        'http://192.168.203.58/FLUTTER_API/learning/read_category_Api.php';
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
        'http://192.168.203.58/FLUTTER_API/learning/read_quiz_Api.php';
    var res = await http.get(Uri.parse(apiLink));
    if (res.statusCode == 200) {
      List json = jsonDecode(res.body);
      List<QuizModel> q1 = json.map((e) => QuizModel.mapToModel(e)).toList();
      return q1;
    }
    return null;
  }

  Future<void> registerData(String name, String email, String password) async {
    String apiLink =
        'http://192.168.203.58/FLUTTER_API/learning/user/register.php';
    var res = await http.post(Uri.parse(apiLink), body: {
      'name': name,
      'email': email,
      'password': password,
    });
    return jsonDecode(res.body);
  }

  Future<Map<String, dynamic>> logIn(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://192.168.203.58/FLUTTER_API/learning/user/login.php'),
      body: {
        'email': email,
        'password': password,
      },
    );
    return jsonDecode(response.body);
  }


  Future<void> logout() async {
    await http.post(Uri.parse('http://192.168.203.58/FLUTTER_API/learning/user/logout.php'),
    );
  }
}
