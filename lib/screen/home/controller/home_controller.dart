import 'dart:math';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:main_exam/screen/home/model/home_model.dart';

import '../../../utils/api_helper.dart';

class HomeController extends GetxController {
  RxList<HomeModel> categoryList = <HomeModel>[].obs;
  RxList colorList = [
    const Color(0xffEE709D),
    const Color(0xffEC8870),
    const Color(0xff4F78EE),
    const Color(0xff11B1FB),
    const Color(0xffA48DD1),
    const Color(0xffF2BDE9),
    const Color(0xff7EAAFF),
    const Color(0xff8DD1D1),
  ].obs;

  Future<void> getCategoryData() async {
    List<HomeModel>? h1 = await ApiHelper.apiHelper.getCategory();
    if (h1 != null) {
      categoryList.value = h1;
    }
  }

  randomColor() {
    Random r1 = Random();
    return colorList[r1.nextInt(colorList.length)];
  }
}
