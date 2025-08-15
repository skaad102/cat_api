import 'package:get/get.dart';

class CatsController extends GetxController {
  CatsController._();
  static CatsController get instance => Get.find();

  static void initController() {
    Get.lazyPut(CatsController._);
  }
}
