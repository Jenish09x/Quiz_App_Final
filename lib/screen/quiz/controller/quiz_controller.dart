import 'package:get/get.dart';
import 'package:main_exam/screen/home/model/home_model.dart';
import 'package:main_exam/screen/quiz/model/quiz_model.dart';
import 'package:main_exam/utils/api_helper.dart';

class QuizController extends GetxController {
  Rxn<List<QuizModel>> quizList = Rxn();
  RxInt index = 0.obs;
  Rxn<List<RandomModel>> randomList = Rxn();
  RxInt checkAns = 1.obs;
  HomeModel? homeModel;

  Future<void> getQuizData(HomeModel category) async {
    homeModel = category;
    List<QuizModel>? list = await ApiHelper.apiHelper.getQuiz();
    if (list != null) {
      quizList.value = list.where((element) => element.category == category.id).toList();
    }
    randomData();
  }

  void randomData() {
    if (quizList.value != null) {
      List<RandomModel> result = [];
      for (QuizModel q1 in quizList.value!) {
        List allOption=[];
        allOption.add(q1.a);
        allOption.add(q1.b);
        allOption.add(q1.c);
        allOption.add(q1.d);
        allOption.shuffle();

        RandomModel r1 = RandomModel(
          question: q1.question,
          correct_answer: q1.a,
          option: allOption,
        );
        result.add(r1);
      }
      randomList.value = result;
      update();
    }
  }

  void getResult(String answer) {
    if (answer == randomList.value![index.value].correct_answer) {
      checkAns.value++;
    }
  }
}
