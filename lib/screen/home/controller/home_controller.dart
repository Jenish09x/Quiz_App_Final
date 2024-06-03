import 'package:get/get.dart';
import 'package:main_exam/screen/home/model/home_model.dart';

import '../../../utils/api_helper.dart';

class HomeController extends GetxController
{
  RxList<HomeModel> categoryList =<HomeModel>[].obs;
  Future<void> getCategoryData()
  async {
    List<HomeModel>? h1 =await ApiHelper.apiHelper.getCategory();
    if(h1!=null)
    {
      categoryList.value=h1;
    }
  }
}